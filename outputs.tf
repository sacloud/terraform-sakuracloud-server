output "ssh_private_key" {
  sensitive = true
  value     = local.ssh_private_key
}

output "ssh_public_key" {
  value = local.ssh_public_key
}

output "ssh_key_id" {
  value = sakuracloud_ssh_key.ssh_key.id
}

output "ssh_key_fingerprint" {
  value = sakuracloud_ssh_key.ssh_key.fingerprint
}

#************************************************
# for Disk
#************************************************
output "disk_id" {
  value = sakuracloud_disk.disk.*.id
}

output "disk_source_archive_id" {
  value = sakuracloud_disk.disk.*.source_archive_id
}

#************************************************
# for Server
#************************************************
output "server_ids" {
  value = sakuracloud_server.server.*.id
}

output "server_names" {
  value = sakuracloud_server.server.*.name
}

output "server_hostnames" {
  value = sakuracloud_server.server.*.hostname
}

output "server_dns_servers" {
  value = sakuracloud_server.server.*.dns_servers
}

output "server_ipaddresses" {
  value = sakuracloud_server.server.*.ipaddress
}

output "server_gateways" {
  value = sakuracloud_server.server.*.gateway
}

output "server_nw_addresses" {
  value = sakuracloud_server.server.*.nw_address
}

output "server_nw_mask_len" {
  value = sakuracloud_server.server.*.nw_mask_len
}

output "server_macaddresses" {
  value = sakuracloud_server.server.*.macaddresses
}

