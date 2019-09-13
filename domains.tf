resource "linode_domain" "cloudartisan_com" {
  soa_email   = "hostmaster@cloudartisan.com"
  ttl_sec     = "300"
  expire_sec  = "300"
  refresh_sec = "300"
  domain      = "cloudartisan.com"
  domain_type = "master"
}

# Use GMail for all @cloudartisan.com addresses
variable "mx_records" {
  type = "map"
  default = {
    "ASPMX.L.GOOGLE.COM"      = 10
    "ALT1.ASPMX.L.GOOGLE.COM" = 20
    "ALT2.ASPMX.L.GOOGLE.COM" = 20
    "ASPMX2.GOOGLEMAIL.COM"   = 30
    "ASPMX3.GOOGLEMAIL.COM"   = 30
    "ASPMX4.GOOGLEMAIL.COM"   = 30
    "ASPMX5.GOOGLEMAIL.COM"   = 30
  }
}

resource "linode_domain_record" "MX_cloudartisan_com" {
  count       = "${length(keys(var.mx_records))}"
  domain_id   = "${linode_domain.cloudartisan_com.id}"
  record_type = "MX"
  # The subdomain to delegate to the target MX server
  name     = "cloudartisan.com"
  target   = "${element(keys(var.mx_records), count.index)}"
  priority = "${element(values(var.mx_records), count.index)}"
}

# GitHub Pages IP address 1
resource "linode_domain_record" "A_cloudartisan_com_root_1" {
  domain_id   = "${linode_domain.cloudartisan_com.id}"
  record_type = "A"
  name        = ""
  target      = "192.30.252.153"
}

# GitHub Pages IP address 2
resource "linode_domain_record" "A_cloudartisan_com_root_2" {
  domain_id   = "${linode_domain.cloudartisan_com.id}"
  record_type = "A"
  name        = ""
  target      = "192.30.252.154"
}
