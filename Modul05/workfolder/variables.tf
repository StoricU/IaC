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