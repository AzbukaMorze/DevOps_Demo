variable "zone" {
  description = "Cloud zone"
  type        = string
}

variable "network_name" {
  description = "Network name"
  type        = string
  default     = "vm-network"
}

variable "subnet_name" {
  description = "Subnet name"
  type        = string
  default     = "vm-subnet"
}

variable "subnet_cidr" {
  description = "Subnet CIDR block"
  type        = string
  default     = "192.168.10.0/24"
}
