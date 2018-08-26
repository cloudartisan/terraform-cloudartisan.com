output "Public IP" {
  value = "${linode_instance.cloudartisan_com.ip_address}"
}

output "Name" {
  value = "${linode_instance.cloudartisan_com.label}"
}
