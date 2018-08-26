provider "linode" {
  key = "${var.linode_key}"
}

resource "linode_instance" "cloudartisan_com" {
  label  = "cloudartisan.com"
  image  = "${var.image}"
  kernel = "${var.kernel}"
  region = "${var.region}"
  type   = "${var.type}"

  private_networking = false

  ssh_key       = "${chomp(file(var.ssh_key_file))}"
  root_password = "${random_string.password.result}"

	provisioner "remote-exec" {
		inline = [
			"sudo apt-get -q update",
		]
	}
}

resource "random_string" "password" {
  length  = 32
  special = true
}
