variable "zone" {
  description = "Cloud zone"
  type        = string
}

variable "vm_name" {
  description = "VM name"
  type        = string
  default     = "terraform-vm"
}

variable "cores" {
  description = "Number of CPU cores"
  type        = number
  default     = 4
}

variable "memory" {
  description = "Memory size in GB"
  type        = number
  default     = 4
}

variable "boot_disk_id" {
  description = "Boot disk ID"
  type        = string
}

variable "subnet_id" {
  description = "Subnet ID"
  type        = string
}

variable "metadata_file" {
  description = "Path to metadata file"
  type        = string
}
