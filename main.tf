terraform {
  required_version = "0.11.2"
}

provider "random" {
  version = "~> 2.0"
}

provider "linode" {
  token = "${var.linode_key}"
}

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
