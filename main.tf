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

resource "linode_instance" "cloudartisan_com" {
  label  = "cloudartisan_com"
  image  = "${var.image}"
  kernel = "${var.kernel}"
  region = "${var.region}"
  type   = "${var.type}"

  private_networking = false

  ssh_key       = "${chomp(file(var.ssh_key_file))}"
  root_password = "${random_string.password.result}"

  # Install packages
  provisioner "remote-exec" {
    inline = [
      "sudo apt-get -q update",
    ]
  }

  # Setup Minecraft
  provisioner "remote-exec" {
    inline = [
      "wget -q http://git.io/Sxpr9g -O /tmp/msm && bash /tmp/msm"
    ]
  }
}

resource "random_string" "password" {
  length  = 32
  special = true
}
