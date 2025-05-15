resource "yandex_compute_instance" "this" {
  name        = var.vm_name
  platform_id = "standard-v3"
  zone        = var.zone

  resources {
    cores  = var.cores
    memory = var.memory
  }

  boot_disk {
    disk_id = var.boot_disk_id
  }

  network_interface {
    subnet_id = var.subnet_id
    nat       = true
  }

  metadata = {
    user-data = file(var.metadata_file)
  }
}
