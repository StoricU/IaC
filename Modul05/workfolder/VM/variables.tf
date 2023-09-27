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

variable "nic_linux_id" {
    type = string
    description = "The ID of the Linux NIC"
  
}

variable "tags" {
  description = "A map of tags to add to resources"
  type        = map(string)
  default     = {}
}
