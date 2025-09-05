variable "name" {
	type = string
}
variable "location" {
	type = string
}
variable "resource_group_name" {
	type = string
}
variable "sku" {
	type    = string
	default = "standard"
}
variable "soft_delete_retention_days" {
	type    = number
	default = 7
}
variable "purge_protection_enabled" {
	type    = bool
	default = false
}
variable "enabled_for_disk_encryption" {
	type    = bool
	default = false
}
variable "tags" {
	type    = map(string)
	default = {}
}
