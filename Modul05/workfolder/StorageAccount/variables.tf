variable "base_name" {
  type        = string
  description = "Storage account name"
}

variable "rgname" {
  type        = string
  description = "Resource group name"
}

variable "location" {
  type        = string
  description = "The Azure Region in which all resources should be created"
}

variable "tags" {
  description = "A map of tags to add to resources"
  type        = map(string)
  default     = {}
}
