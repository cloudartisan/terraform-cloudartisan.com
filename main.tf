terraform {
  required_version = "0.12.8"
}

provider "random" {
  version = "~> 2.2"
}

provider "linode" {
  version = "~> 1.8"
  token   = "${var.linode_key}"
}

data "linode_profile" "me" {}

resource "random_string" "password" {
  length  = 32
  special = true
}
