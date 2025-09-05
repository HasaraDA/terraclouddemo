variable "name" {
  type        = string
  description = "Name of the resource group"
}

variable "location" {
  type        = string
  description = "Azure region (eg southeastasia)"
}

variable "tags" {
  type        = map(string)
  description = "Tags to apply"
  default     = {}
}
