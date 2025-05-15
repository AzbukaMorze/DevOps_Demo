terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
}

provider "yandex" {
  zone  = var.yandex_zone
  token = var.yandex_token
  folder_id = var.yandex_folder_id
}

resource "yandex_vpc_network" "network-1" {
  name = "vm-network"
}

resource "yandex_vpc_subnet" "subnet-1" {
  name           = "vm-subnet"
  zone           = var.yandex_zone
  network_id     = yandex_vpc_network.network-1.id
  v4_cidr_blocks = ["192.168.10.0/24"]
}

resource "yandex_compute_disk" "boot-disk" {
  name     = "vm-disk"
  type     = "network-hdd"
  zone     = var.yandex_zone
  size     = var.boot_disk_size
  image_id = "fd86601pa1f50ta9dffg"
}

resource "yandex_compute_instance" "vm-1" {
  name        = "terraform-vm"
  platform_id = "standard-v1"
  zone        = var.yandex_zone

  resources {
    cores  = var.vm_cores
    memory = var.vm_memory
  }

  boot_disk {
    disk_id = yandex_compute_disk.boot-disk.id
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.subnet-1.id
    nat       = true
  }

  metadata = {
    user-data = file("meta.txt")
  }
}
