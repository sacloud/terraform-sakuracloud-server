variable os_type {
  default = "centos"
}

variable password {
  description = "Password for server root user"
}

variable ssh_key_name {
  default = "sshkey"
}

variable ssh_public_key {
  default = ""
}

variable disk_connector {
  default = "virtio"
}

variable disk_name {
  default = ""
}

variable disk_size {
  default     = 20
  description = "Size of master node disk(Unit:GB)"
}

variable disk_icon_id {
  default = ""
}

variable disk_plan {
  default = "ssd"
}

variable disk_description {
  default = ""
}

variable disk_tags {
  type    = "list"
  default = []
}

variable disable_pw_auth {
  default = true
}

variable startup_script_ids {
  type    = "list"
  default = []
}

variable hostname {
  default = ""
}

variable server_name {
  default = "server"
}

variable server_cdrom_id {
  default = ""
}

variable server_icon_id {
  default = ""
}

variable server_additional_disks {
  type    = "list"
  default = []
}

variable server_core {
  default     = 1
  description = "Number of master node CPU core"
}

variable server_memory {
  default     = 1
  description = "Size of master node memory(Unit:GB)"
}

variable server_description {
  default = ""
}

variable server_tags {
  type    = "list"
  default = []
}

variable server_interface_driver {
  default = "virtio"
}

variable packet_filter_ids {
  type    = "list"
  default = []
}

variable additional_nics {
  type    = "list"
  default = []
}

variable nic {
  default = "shared"
}

variable ipaddress {
  default = ""
}

variable gateway {
  default = ""
}

variable nw_mask_len {
  default = 0
}

locals {
  disk_name     = "${var.disk_name == "" ? var.server_name : var.disk_name}"
  hostname      = "${var.hostname == "" ? var.server_name : var.hostname}"
  nw_mask_len   = "${var.nw_mask_len == 0 ? "" : var.nw_mask_len}"
  ssh_key_count = "${var.ssh_public_key == "" ? 1 : 0}"
  disk_ids      = "${concat(list(sakuracloud_disk.disk.id), var.server_additional_disks)}"
}