variable "base_name" {
  type        = string
  description = "The base name for all resources"
}

variable "rgname" {
  type        = string
  description = "Resource group name"
}

variable "location" {
  type        = string
  description = "The Azure Region in which all resources should be created"
}
