variable "location" {
  type        = string
  description = "Lokasjon for ressursene"
  default     = "westeurope"
}

variable "rg_name" {
  type        = string
  description = "Navn på resource groups"
  default     = "rg-modul09-jm"
}

variable "sa_name" {
  type        = string
  description = "Navn på storage account"
  default     = "sajm"
}

variable "source_content" {
  type        = string
  description = "Innholdet i filen som skal lastes opp"
  default     = "<h1>My first Terraform project</h1>"
}

variable "index_document" {
  type        = string
  description = "Navn på index document"
  default     = "index.html"
}

variable "vnet_name" {
  type        = string
  description = "Vnet name"
  default     = "vnet-jm"
}

variable "snet_name" {
  type        = string
  description = "subnet name"
  default     = "internal"

}