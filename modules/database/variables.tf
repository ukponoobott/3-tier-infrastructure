variable "resource_group" {
    description = "This specifies the resource group of the db"
    type = string
}   

variable "location" {
    description = "This specifies the location of the db" 
    default = "eastus"
    type = string
}

variable "dev_database" {
    description = "This specifies the database name"
    type = string
}

variable "dev_database_version" {
    description = "This specifies the version of the database"
    type = string
}

variable "dev_database_admin" {
    description = "This specifies the database administrator login"
    type = string
}

variable "dev_database_password" {
    description = "This specifies the administrator login password"
    type = string
}

variable "data-subnet-id" {
  description = "ID of database subnet"
  type = string
}