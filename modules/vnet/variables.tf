variable "name" {
  type = string
}
variable "location" {
  type = string
}
variable "resource_group_name" {
  type = string
}
variable "address_space" {
  type = list(string)
  default = ["10.20.0.0/16"]
}
variable "subnets" {
  description = "Map of subnets: { aks = { address_prefixes = [...] }, db = {...} }"
  type = map(object({
    address_prefixes = list(string)
    delegations      = optional(list(object({
      name    = string
      service = string
      actions = optional(list(string))
    })), [])
  }))
  default = {
    aks = {
      address_prefixes = ["10.20.1.0/24"]
    }
    db = {
      address_prefixes = ["10.20.2.0/24"]
    }
    pe = {
      address_prefixes = ["10.20.3.0/24"]
    }
  }
}
variable "tags" {
  type    = map(string)
  default = {}
}
