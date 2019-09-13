resource "linode_instance" "minecraft_cloudartisan_com" {
  label      = "minecraft.cloudartisan.com"
  region     = var.region
  type       = var.type
  private_ip = false

  disk {
    label = "boot"
    size  = 3000
    image = var.image

    # Any of authorized_keys, authorized_users, and root_pass
    # can be used for provisioning.
    authorized_keys  = [chomp(file(var.ssh_key_file))]
    authorized_users = [data.linode_profile.me.username]
    root_pass        = "${random_string.password.result}"
  }

  config {
    label  = "boot_config"
    kernel = var.kernel
    devices {
      sda {
        disk_label = "boot"
      }
      sdb {
        volume_id = linode_volume.minecraft_volume.id
      }
    }
    root_device = "/dev/sda"
  }

  boot_config_label = "boot_config"

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

resource "linode_volume" "minecraft_volume" {
  label  = "minecraft_volume"
  size   = 20
  region = var.region
}
