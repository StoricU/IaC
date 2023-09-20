#Kommentarer
variable "location" {
  type        = string
  description = "Lokasjon for ressursene"
  #default     = "West Europe"
}

variable "rgname" {
  type        = string
  description = "Navn på resource group"
  #default     = "rg-jma-terraform"
}

variable "saname" {
  type        = string
  description = "Storage account name"
}

variable "vnet" {
  type        = string
  description = "Navn på Vnet"
  #default     = "vnet-jma-06-we"
}

variable "nsg" {
    type = string
    description = "Navn på network security group"
    #default = "nsg-demo-06"
}

variable "snname01" {
    type = string
    description = "Subnet 01 name"
}
variable "snname02" {
    type = string
    description = "Subnet 02 name"
}

variable "snapfix01" {
    type = string
    description = "Addresseområde for subnet 01"
}

variable "snapfix02" {
    type = string
    description = "Addresseområde for subnet 02"
}