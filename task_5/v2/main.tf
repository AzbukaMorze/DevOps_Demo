terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">= 0.13"
}

provider "yandex" {
  zone      = var.yandex_zone
  token     = var.yandex_token
  folder_id = var.yandex_folder_id
}

module "network" {
  source      = "./modules/network"
  zone        = var.yandex_zone
  subnet_cidr = "192.168.10.0/24"
}

module "disk" {
  source    = "./modules/disk"
  size      = var.boot_disk_size
  zone      = var.yandex_zone
  image_id  = "fd8136cthbfr503tjj72"
}

module "vm" {
  source        = "./modules/vm"
  zone          = var.yandex_zone
  boot_disk_id  = module.disk.disk_id
  subnet_id     = module.network.subnet_id
  metadata_file = "meta.txt"
}
