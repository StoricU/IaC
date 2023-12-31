variable "base_name" {
    type = string
    description = "The base name for all resources"
}

variable "location" {
    type = string
    description = "The Azure Region in which all resources should be created"
}

variable "tags" {
  description = "A map of tags to add to resources"
  type        = map(string)
  default     = {}
}
