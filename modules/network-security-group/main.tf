resource "azurerm_network_security_group" "web-nsg" {
  name                = "web-nsg"
  location            = var.location
  resource_group_name = var.resource_group
  
  security_rule {
    name                       = "access-web-http"
    priority                   = 105
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_address_prefix      = "*"
    source_port_range          = "*"
    destination_address_prefix = "*"
    destination_port_range     = "80"
                }
  
  security_rule {
    name                       = "access-web-rdp"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_address_prefix      = "*"
    source_port_range          = "*"
    destination_address_prefix = "*"
    destination_port_range     = "3389"
                }

  security_rule {
    name                       = "access-web-outbound"
    priority                   = 110
    direction                  = "Outbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_address_prefix      = "*"
    source_port_range          = "*"
    destination_address_prefix = "*"
    destination_port_range     = "80"
                }
}

resource "azurerm_subnet_network_security_group_association" "web-nsg-subnet" {
  subnet_id                 = var.web_subnet_id
  network_security_group_id = azurerm_network_security_group.web-nsg.id
}


resource "azurerm_network_security_group" "app-nsg" {
  name                = "app-nsg"
  location            = var.location
  resource_group_name = var.resource_group
  
      security_rule {
        name                       = "acesss-inbound-from-web-all"
        priority                   = 115
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_address_prefix      = "10.0.1.0/24"
        source_port_range          = "*"
        destination_address_prefix = "*"
        destination_port_range     = "*"
                    }

      security_rule {
        name                       = "acesss-ping-from-web-all"
        priority                   = 117
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Icmp"
        source_address_prefix      = "10.0.1.0/24"
        source_port_range          = "*"
        destination_address_prefix = "*"
        destination_port_range     = "*"
                    }
      
      security_rule {
        name                       = "allow-outbound-to-web-all"
        priority                   = 120
        direction                  = "Outbound"
        access                     = "Allow"
        protocol                   = "*"
        source_address_prefix      = "10.0.2.0/24"
        source_port_range          = "*"
        destination_address_prefix = "*"
        destination_port_range     = "*"
                  }

      security_rule {
        name                       = "deny-outbound-to-internet"
        priority                   = 125
        direction                  = "Outbound"
        access                     = "Deny"
        protocol                   = "*"
        source_address_prefix      = "*"
        source_port_range          = "*"
        destination_address_prefix = "0.0.0.0/0"
        destination_port_range     = "*"
                  }
  }

  resource "azurerm_subnet_network_security_group_association" "app-nsg-subnet" {
    subnet_id                 = var.app_subnet_id
    network_security_group_id = azurerm_network_security_group.app-nsg.id
  }

  resource "azurerm_network_security_group" "db-nsg" {
      name = "db-nsg"
      location = var.location
      resource_group_name = var.resource_group

      security_rule {
          name = "allow-inbound-from-app-all"
          priority = 130
          direction = "Inbound"
          access = "Allow"
          protocol = "Tcp"
          source_address_prefix = "10.0.2.0/24"
          source_port_range = "*"
          destination_address_prefix = "10.0.3.0/24"
          destination_port_range = "*"
      }
      
      security_rule {
          name = "allow-outbound-to-app-all"
          priority = 135
          direction = "Outbound"
          access = "Allow"
          protocol = "Tcp"
          source_address_prefix = "10.0.3.0/24"
          source_port_range = "*"
          destination_address_prefix = "10.0.2.0/24"
          destination_port_range = "*"
      }
      
      security_rule {
          name = "deny-outbound-to-internet"
          priority = 140
          direction = "Outbound"
          access = "Deny"
          protocol = "Tcp"
          source_address_prefix = "10.0.3.0/24"
          source_port_range = "*"
          destination_address_prefix = "Internet"
          destination_port_range = "*"
      }

      security_rule {
          name = "deny-outbound-to-web"
          priority = 145
          direction = "Outbound"
          access = "Allow"
          protocol = "Tcp"
          source_address_prefix = "10.0.3.0/24"
          source_port_range = "*"
          destination_address_prefix = "10.0.1.0/24"
          destination_port_range = "*"
      }
}

resource "azurerm_subnet_network_security_group_association" "db-nsg-subnet" {
  subnet_id                 = var.db_subnet_id
  network_security_group_id = azurerm_network_security_group.db-nsg.id
}