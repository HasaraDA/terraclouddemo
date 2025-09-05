variable "name" { 
    type = string 
}
variable "resource_group_name" { 
    type = string 
}
variable "location" { 
    type = string 
}
variable "sku" { 
    type = string 
    default = "Basic" 
}
variable "ip_rules" { 
    type = list(string) 
    default = [] 
}
variable "tags" { 
    type = map(string) 
    default = {} 
}
