variable "rg_location" {
  type        = string
  description = "Lokasjon for ressursene"
}

variable "rg_name" {
  type        = string
  description = "Navn på resource groups"
}

variable "sa_name" {
  type        = string
  description = "Navn på storage account"
}

variable "source_content" {
  type        = string
  description = "Innholdet i filen som skal lastes opp"
}
  
variable "index_document" {
  type        = string
  description = "Navn på index document"
}