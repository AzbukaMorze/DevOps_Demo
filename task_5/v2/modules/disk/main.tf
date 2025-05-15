resource "yandex_compute_disk" "this" {
  name     = var.disk_name
  type     = "network-hdd"
  zone     = var.zone
  size     = var.size
  image_id = var.image_id
}
