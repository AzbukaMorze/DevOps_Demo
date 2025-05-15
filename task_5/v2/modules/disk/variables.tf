variable "zone" {
  description = "Cloud zone"
  type        = string
}

variable "disk_name" {
  description = "Disk name"
  type        = string
  default     = "vm-disk"
}

variable "size" {
  description = "Disk size in GB"
  type        = number
  default     = 20
}

variable "image_id" {
  description = "Base image ID"
  type        = string
}
