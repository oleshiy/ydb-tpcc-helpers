terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">= 0.13"
}

provider "yandex" {
  service_account_key_file = var.key_path
  cloud_id                 = var.cloud_id
  folder_id                = var.folder_id
  zone                     = var.zone_name[0]
}

#=========== Instance =============#

resource "yandex_compute_instance" "tpcc-runners" {
  count = var.instance_count
  name  = "${var.instance_name}-${1 + count.index}"
  hostname = "${var.instance_hostname}-${1 + count.index}"
  allow_stopping_for_update = true

  resources {
    cores  = var.instance_cores
    memory = var.instance_memory
  }

  boot_disk {
    initialize_params {
      image_id = var.instance_image_id
      size = var.instance_boot_disk_size
      type = var.instance_boot_disk_type
      name = "${var.instance_name}-${1 + count.index}-boot"
    }
  }

  network_interface {
    subnet_id = var.instance_subnet
    nat       = var.instance_nat
  }

  metadata = {
    ssh-keys = "var.user:${file(var.ssh_key_pub_path)}"
  }

}

