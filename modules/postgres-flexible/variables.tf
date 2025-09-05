
variable "name" { 
    type = string 
}
variable "resource_group_name" { 
    type = string 
}
variable "location" { 
    type = string 
}

variable "admin_login" { 
    type = string 
    default = "pgadmin" 
}
variable "admin_password" { 
    type = string 
    default = "" 
} # if empty, random will be generated

variable "sku_name" {
  type    = string
  default = "GP_Standard_D2s_v3"
}

variable "storage_mb" { 
    type = number 
    default = 32768 
}

variable "postgres_version" {
  type    = string
  default = "13"
}

variable "backup_retention_days" { 
    type = number 
    default = 7 
}
variable "high_availability_mode" { 
    type = string 
    default = "Disabled" 
}
variable "timezone" { 
    type = string 
    default = "UTC" 
}

variable "delegated_subnet_id" { 
    type = string 
    default = null 
} # if provided, VNet integration will be enabled

variable "tags" { 
    type = map(string) 
    default = {} 
}

