variable "location" {
  type        = string
  description = "Lokasjon for ressursene"
  default = "westeurope"
}

variable "rg_name" {
  type        = string
  description = "Navn på resource groups"
  default = "rg-jm"
}

variable "sa_name" {
  type        = string
  description = "Navn på storage account"
  default = "sajm"
}

variable "source_content" {
  type        = string
  description = "Innholdet i filen som skal lastes opp"
  default = "<h1>Mitt første Terraform prosjekt</h1>"
}
  
variable "index_document" {
  type        = string
  description = "Navn på index document"
  default = "index.html"
}