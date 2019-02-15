/******************************************************************************
 * SSH key-pair
 *****************************************************************************/
resource "tls_private_key" "ssh_key" {
  algorithm = "RSA"
}

locals {
  ssh_public_key  = "${var.ssh_public_key == "" ? tls_private_key.ssh_key.public_key_openssh : var.ssh_public_key }"
  ssh_private_key = "${var.ssh_public_key == "" ? tls_private_key.ssh_key.private_key_pem : "" }"
}

resource sakuracloud_ssh_key "ssh_key" {
  name       = "${var.ssh_key_name}"
  public_key = "${local.ssh_public_key}"
}

/******************************************************************************
 * Nodes
 *****************************************************************************/
data sakuracloud_archive "os" {
  os_type = "${var.os_type}"
}

// disk for master
resource sakuracloud_disk "disk" {
  name              = "${local.disk_name}"
  connector         = "${var.disk_connector}"
  plan              = "${var.disk_plan}"
  source_archive_id = "${data.sakuracloud_archive.os.id}"
  icon_id           = "${var.disk_icon_id}"
  size              = "${var.disk_size}"
  description       = "${var.disk_description}"
  tags              = ["${var.disk_tags}"]

  lifecycle {
    ignore_changes = ["source_archive_id"]
  }
}

// server for master
resource sakuracloud_server "server" {
  name              = "${var.server_name}"
  core              = "${var.server_core}"
  memory            = "${var.server_memory}"
  interface_driver  = "${var.server_interface_driver}"
  additional_nics   = ["${var.additional_nics}"]
  disks             = ["${local.disk_ids}"]
  cdrom_id          = "${var.server_cdrom_id}"
  icon_id           = "${var.server_icon_id}"
  packet_filter_ids = ["${var.packet_filter_ids}"]
  description       = "${var.server_description}"
  tags              = ["${var.server_tags}"]
  nic               = "${var.nic}"
  ipaddress         = "${var.ipaddress}"
  gateway           = "${var.gateway}"
  nw_mask_len       = "${local.nw_mask_len}"

  ssh_key_ids     = ["${sakuracloud_ssh_key.ssh_key.id}"]
  note_ids        = ["${var.startup_script_ids}"]
  hostname        = "${local.hostname}"
  password        = "${var.password}"
  disable_pw_auth = "${var.disable_pw_auth}"
}
