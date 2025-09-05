variable "name" { 
    type = string 
}
variable "location" { 
    type = string 
}
variable "resource_group_name" { 
    type = string 
}
variable "dns_prefix" { 
    type = string 
    default = "aks" 
}

variable "node_pool_name" { 
    type = string 
    default = "sys" 
}
variable "node_count" { 
    type = number 
    default = 2 
}
variable "node_vm_size" { 
    type = string 
    default = "Standard_DS2_v2" 
}
variable "node_os_disk_size_gb" { 
    type = number 
    default = 30 
}
variable "max_pods" { 
    type = number 
    default = 110 
}

variable "k8s_version" { 
    type = string 
    default = null 
} # optional

variable "network_plugin" { 
    type = string 
    default = "azure" 
}
variable "network_policy" { 
    type = string 
    default = "azure" 
}
variable "dns_service_ip" { 
    type = string 
    default = "10.0.0.10" 
}
variable "service_cidr" { 
    type = string 
    default = "10.0.0.0/16" 
}
variable "docker_bridge_cidr" { 
    type = string 
    default = "172.17.0.1/16" 
} # optional

variable "acr_id" { 
    type = string 
} # resource id of ACR for role assignment

variable "enable_monitoring" { 
    type = bool 
    default = false 
}
variable "log_analytics_workspace_id" { 
    type = string 
    default = null 
} # optional, required if enable_monitoring is true     

variable "tags" { 
    type = map(string) 
    default = {} 
}
