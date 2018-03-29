module "server" {
  source = "sacloud/server/sakuracloud"

  // (required) password
  password = "<put-your-password-here>"

  # for archive
  // os_type = "centos"

  # for SSH Key
  // ssh_key_name   = "sshkey"
  // ssh_public_key = ""       // If this value is empty, a key pair is generated

  # for Disk
  // disk_connector   = "virtio"
  // disk_plan        = "ssd"
  // disk_name        = ""               // If this value is empty, use server_name instead
  // disk_size        = 20
  // disk_icon_id     = ""
  // disk_description = ""
  // disk_tags        = ["tag1", "tag2"]

  # for Disk Edit
  // disable_pw_auth    = true
  // startup_script_ids = [""]
  // hostname           = ""   // If this value is empty, use server_name instead

  # for Server
  // server_name             = "server"
  // server_core             = 1
  // server_memory           = 1
  // server_interface_driver = "virtio"
  // server_cdrom_id         = ""
  // server_icon_id          = ""
  // server_additional_disks = [""]
  // server_description      = ""
  // server_tags             = ["tag1", "tag2"]
  // packet_filter_ids       = [""]
  // additional_nics         = [""]
  // nic                     = "shared"
  // ipaddress               = ""
  // gateway                 = ""
  // nw_mask_len             = 24
}

//
// If you want to save the generated secret key, uncomment the following
//
# resource "null_resource" "store_private_key" {
#   triggers {
#     ssh_key_id = "${module.server.ssh_key_id}"
#   }
#
#   provisioner "local-exec" {
#     command = "echo '${module.server.ssh_private_key}' > ${path.root}/id_rsa ; chmod 0600 ${path.root}/id_rsa"
#   }
#
#   provisioner "local-exec" {
#     when    = "destroy"
#     command = "rm -f ${path.root}/id_rsa"
#   }
# }

