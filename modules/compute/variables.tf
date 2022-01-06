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

variable "web_host_name" {
    description = "This specifies the host name of the web-vm"
    type = string
}

variable "web_username" {
    description = "This specifies the username of the web-vm"
    type = string
}

variable "web_os_password" {
    description = "This specifies the passoword of the web-vm"
    type = string
}

variable "app_subnet_id" {
    description = "This specifies the address apace of the app subnet"
    type = string
}

variable "app_host_name" {
    description = "This specifies the host name of the app-vm"
    type = string
}

variable "app_username" {
    description = "This specifies the username of the app-vm"
    type = string
}

variable "app_os_password" {
    description = "This specifies the password of the app-vm"
    type = string
}