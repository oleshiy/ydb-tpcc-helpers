#=============== Auth vars control zone ===========#

variable "key_path" {
    description = "Path to the json file with service account credentials"
    type = string
    default = "/Users/olegbondar/.ssh/sa-lab.key"
}

variable "cloud_id" {
    description = "Yandex cloud ID"
    type = string
    default = "b1g8skpblkos03malf3s"
}

variable "folder_id" {
    description = "Yandex folder ID"
    type = string
    default = "b1gkbgcsketgduq89le6"
}

variable "zone_name" {
    description = "Names of availability zones to use"
    type = list(string)
    default = ["ru-central1-a", "ru-central1-b", "ru-central1-d"]  
}

#=============== VM control vars zone ==============#

variable "instance_count" {
    type = number
    default = 4
    description = "Number of VMs being created"
}

variable "instance_platform" {
    type = string
    default = "standard-v3"
    description = "standard-v1 – Intel Broadwell, -v2 – Intel Cascade Lake, -v3 – Intel Ice Lake"
}

variable "instance_cores" {
  type = number
  default = 32
  description = "Number of vCPU per instance"
}

variable "instance_memory" {
  type = number
  default = 96
  description = "GB of RAM per instance"
}

variable "instance_name" {
  type = string
  default = "tpcc-runner"
  description = "Prefix for node names"
}

variable "instance_hostname" {
  type = string
  default = "tpcc-runner"
  description = "Prefix for node hostnames"
}

variable "instance_image_id" {
  type = string
  default = "fd83b9pkhhr6m7tegqjm"
  description = "Ubuntu 24.04 LTS image. Run `yc compute image list --folder-id standard-images` to get a list of available OS images."
}

variable "instance_subnet" {
  type = string
  default = "e9bv5g8okse7c63dampn"
  description = "Intance subnet id"
}

variable "instance_nat" {
  type = bool
  default = true
  description = "Intance NAT"
}

variable "user" {
    type = string
    default = "olegbondar"
    description = "Username to connect via SSH"
}

variable "ssh_key_pub_path" {
    type = string
    description = "Path to the public part of SSH-key"
    default = "~/.ssh/id_ed25519.pub"
}

#========== Instance boot disk =======#

variable "instance_boot_disk_size" {
    type = number
    default = 93
    description = "VM boot disk size in GB"
}

variable "instance_boot_disk_type" {
    type = string
    default = "network-ssd-nonreplicated"
    description = "VM boot disk type"
}
