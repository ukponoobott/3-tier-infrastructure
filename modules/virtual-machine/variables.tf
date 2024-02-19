variable "resource_group_name" {
  description = "This specifies the resource group of the virtual machine"
  type        = string
}

variable "location" {
  description = "This specifies the location of the virtual machine"
  default     = "eastus"
  type        = string
}

variable "workload" {

}

variable "subnet_id" {
  description = "This specifies the address apace of the web subnet"
  type        = string
}

variable "sku" {
  description = "The size of the VM to be used for the infrastructure"
  type        = string
}

variable "admin_username" {
  description = "This specifies the username of the VMs"
  type        = string
}

variable "admin_password" {
  description = "This specifies the passoword of the VMs"
  type        = string
}

variable "enabled_public_access" {
  type    = bool
  default = false
}

variable "public_ip_address_id" {
  description = "PIP for Web VM"
  type        = string
  default     = null
}