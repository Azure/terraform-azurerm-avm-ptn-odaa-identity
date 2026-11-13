mock_provider "azapi" {
  mock_data "azapi_client_config" {
    defaults = {
      client_id                = "00000000-0000-0000-0000-000000000000"
      object_id                = "00000000-0000-0000-0000-000000000000"
      subscription_id          = "00000000-0000-0000-0000-000000000000"
      tenant_id                = "00000000-0000-0000-0000-000000000000"
      subscription_resource_id = "/subscriptions/00000000-0000-0000-0000-000000000000"
    }
  }
}

variables {
  address_space    = ["10.0.0.0/16"]
  enable_telemetry = false
  location         = "eastus2"
  name             = "vnet-test"
  parent_id        = "/subscriptions/00000000-0000-0000-0000-000000000000/resourceGroups/rg-test"
}

run "creates_starter_virtual_network" {
  command = apply

  assert {
    condition     = output.name == "vnet-test" && azapi_resource.this.location == "eastus2"
    error_message = "The starter virtual network must preserve the supplied name and location."
  }

  assert {
    condition     = azapi_resource.this.body.properties.addressSpace.addressPrefixes == var.address_space
    error_message = "The starter virtual network must use the supplied address prefixes."
  }
}

run "rejects_invalid_address_prefix" {
  command = plan

  variables {
    address_space = ["not-a-cidr"]
  }

  expect_failures = [var.address_space]
}
