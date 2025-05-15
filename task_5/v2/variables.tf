variable "yandex_zone" {
  description = "Зона доступности Yandex Cloud"
  default     = "ru-central1-d"
}

variable "vm_cores" {
  description = "Количество vCPU для ВМ"
  default     = 2
}

variable "vm_memory" {
  description = "Объем RAM для ВМ (ГБ)"
  default     = 2
}

variable "boot_disk_size" {
  description = "Размер загрузочного диска (ГБ)"
  default     = 20
}

variable "yandex_token" {
  description = "OAuth-токен Yandex Cloud"
  sensitive   = true
}

variable "yandex_folder_id" {
  description = "ID папки Yandex Cloud"
  type        = string
}
