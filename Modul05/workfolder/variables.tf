#Kommentarer
variable "location" {
  type        = string
  description = "Lokasjon for ressursene"
}

variable "rgname" {
  type        = list(string)
  description = "Navn på resource groups"
  default = [ "rg-IaC-vnet-001", "rg-IaC-sa-001" ]
}

variable "saname" {
  type        = list(string)
  description = "Storage account name"
  default = [ "satisipjm001", "satisipjm002","satisipjm003" ]
}

variable "vnetname" {
  type        = list(string)
  description = "Navn på Vnet"
  default     = ["vnet-production-001", "vnet-development-001"]
}

variable "nsgname" {
  type        = list(string)
  description = "Navn på network security group"
  default = [ "nsg-vnet-prod-001","nsg-vnet-develop-001" ]
}

variable "subnname" {
  type        = list(string)
  description = "Navn på subnet"
  default     = ["sn-production-001", "sn-development-001"]
}

variable "snetadpfix" {
  type        = list(string)
  description = "Addresseområde for subnet"
  default     = ["10.2.1.0/24", "10.2.2.0/24"]
}
variable "addspace" {
  type        = list(string)
  description = "Address space for Vnet"
  default     = ["10.2.0.0/16"]
}

variable "project" {
  type    = string
  default = "Hvilket prosjekt som bruker ressurs"
}

variable "owner" {
  type = string
  description = "Navn på eier av ressurs"  
}

variable "billing_code" {
  type = string
  description = "Billing code"
  
}

variable "company" {
  type = string
  description = "Navn på bedrift"  
}