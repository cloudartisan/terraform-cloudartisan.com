variable "linode_key" {}

# To see all images, sorted:
# curl -s https://api.linode.com/v4/images | jq -r '.data[].id' | sort
variable "image" {
  default = "linode/ubuntu18.04" # Ubuntu 18.04 LTS
}

# To see all kernels, sorted:
# curl -s https://api.linode.com/v4/linode/kernels | jq -r '.data[].id' | sort
variable "kernel" {
  default = "linode/latest-64bit"
}

# To see all regions, sorted:
# curl -s https://api.linode.com/v4/regions | jq -r '.data[].id' | sort
#
# For download speed tests:
# https://www.linode.com/speedtest
variable "region" {
  default = "us-central" # Dallas, TX, USA
}

# To see all types:
# curl -s https://api.linode.com/v4/linode/types | jq
#
# Type g6-standard-4 consists of:
# curl -s https://api.linode.com/v4/linode/types/g6-standard-4 | jq
# {
#   "vcpus": 4,
#   "price": {
#     "hourly": 0.06,
#     "monthly": 40
#   },
#   "id": "g6-standard-4",
#   "label": "Linode 8GB",
#   "network_out": 5000,
#   "transfer": 5000,
#   "addons": {
#     "backups": {
#       "price": {
#         "hourly": 0.015,
#         "monthly": 10
#       }
#     }
#   },
#   "disk": 163840,
#   "memory": 8192,
#   "class": "standard"
# }
variable "type" {
  default = "g6-standard-4"
}

variable "ssh_key_file" {
  default = "~/.ssh/id_rsa.pub"
}

