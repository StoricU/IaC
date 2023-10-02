variable "rg_backend_location" {
  type        = string
  description = "Lokasjon for ressursene"
}

variable "rg_backend_name" {
  type        = string
  description = "Navn på resource groups"
}

variable "sa_backend_name" {
  type        = string
  description = "Storage account name"
}

variable "sc_backend_name" {
  type        = string
  description = "Storage account name"
}

variable "kv_backend_name" {
  type        = string
  description = "Storage account name"
}

variable "sa_backend_accesskey_name" {
    type = string
    description = "keyvault accesskey name"
  
}