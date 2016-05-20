# Create a network security group
resource "azurerm_network_security_group" "backend" {
  name                = "backend"
  location            = "${var.location}"
  resource_group_name = "${var.resource_group_name}"
}

# Create network security group rules

resource "azurerm_network_security_rule" "be_denyfrominternet" {
  name                        = "be_denyfrominternet"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Deny"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "*"
  source_address_prefix       = "Internet"
  destination_address_prefix  = "*"
  resource_group_name         = "${var.resource_group_name}"
  network_security_group_name = "${azurerm_network_security_group.backend.name}"
}
