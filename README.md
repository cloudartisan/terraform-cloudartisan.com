# Prerequisites

https://www.linode.com/docs/applications/configuration-management/how-to-build-your-infrastructure-using-terraform-and-linode/

NOTE: Use git@github.com:displague/terraform-provider-linode.git for the
provider until github.com/LinodeContent/terraform-provider-linode is updated.

To force `go get` to clone from git: over SSH instead of HTTPS, try something
like:

1. Install Terraform and the Linode provider
1. Install Golang

# Linode Types

```bash
curl -s https://api.linode.com/v4/linode/types | jq -r '.data[].id'
```
