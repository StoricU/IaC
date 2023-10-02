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
variable "client_id" {
  description = "Azure Service Principal Client ID"
  default     = ""
}

variable "client_secret" {
  description = "Azure Service Principal Client Secret"
  default     = ""
}

variable "tenant_id" {
  description = "Azure Tenant ID"
  default     = ""
}

variable "subscription_id" {
  description = "Azure Subscription ID"
  default     = ""
}
