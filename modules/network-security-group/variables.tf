variable "resource_group_name" {
  description = "This specifies the resource group of the virtual network"
  type        = string
}

variable "location" {
  description = "This specifies the location of the virtual network"
  default     = "eastus"
  type        = string
}

variable "nsg_name" {

}

variable "security_rules" {

}