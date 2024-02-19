variable "resource_group_name" {
  description = "This specifies the resource group of the virtual machine"
  type        = string
}

variable "location" {
  description = "This specifies the location of the virtual machine"
  type        = string
}

variable "virtual_network_name" {

}

variable "address_space" {
  description = "This specifies the address space of the virtual network"
  type        = list(string)
}

variable "subnets" {
  type = map(string)
}

variable "vm_sku" {

}

variable "web_instances" {
  type = list(string)
}

variable "api_instances" {
  type = list(string)
}


variable "db_server_name" {

}


variable "databases" {
  type = list(string)
}

variable "database_version" {
  description = "This specifies the version of the database"
  type        = string
}

variable "administrator_login" {
  description = "This specifies the database administrator login"
  type        = string
}

variable "administrator_login_password" {
  description = "This specifies the administrator login password"
  type        = string
}

variable "security_rules" {
  type = map(object({
    access                     = string
    priority                   = number
    direction                  = string
    access                     = string
    source_address_prefix      = optional(list(string), null)
    source_port_range          = string
    destination_address_prefix = optional(list(string), null)
    destination_port_range     = string
  }))
}

