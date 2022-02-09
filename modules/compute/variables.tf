variable "resource_group" {
    description = "This specifies the resource group of the virtual machine"
    type = string
}   

variable "location" {
    description = "This specifies the location of the virtual machine" 
    default = "eastus"
    type = string
}

variable "web_subnet_id" {
    description = "This specifies the address apace of the web subnet"
    type = string
}

variable "app_subnet_id" {
    description = "This specifies the address apace of the app subnet"
    type = string
}

variable "sku" {
    description = "The size of the VM to be used for the infrastructure"
    type = string 
}

variable "username" {
    description = "This specifies the username of the VMs"
    type = string
}

variable "password" {
    description = "This specifies the passoword of the VMs"
    type = string
}

variable "web-pip" {
    description = "PIP for Web VM"
    type = string
}