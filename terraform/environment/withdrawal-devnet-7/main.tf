////////////////////////////////////////////////////////////////////////////////////////
//                            TERRAFORM PROVIDERS & BACKEND
////////////////////////////////////////////////////////////////////////////////////////
terraform {
  required_providers {
    digitalocean = {
      source = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 3.0"
    }
    sops = {
      source  = "carlpett/sops"
      version = "0.7.1"
    }
  }
}

terraform {
  backend "s3" {
    skip_credentials_validation = true
    skip_metadata_api_check     = true
    endpoint                    = "https://fra1.digitaloceanspaces.com"
    region                      = "us-east-1"
    bucket                      = "merge-testnets"
    key                         = "infrastructure/withdrawal-devnet-7/terraform.tfstate"
  }
}
////////////////////////////////////////////////////////////////////////////////////////
//                                        VARIABLES
////////////////////////////////////////////////////////////////////////////////////////
variable "ethereum_network" {
  type = string
  default = "withdrawal-devnet-7"
}

variable "digitalocean_project_name" {
  type = string
  default = "Withdrawals"
}

variable "digitalocean_ssh_key_name" {
  type = string
  default = "barnabasbusa"
}

variable "digitalocean_vpcs" {
  type = map
  default = {
    "ams3" = {
      ip_range = "10.100.91.0/24"
    }
  }
}

variable "digitalocean_vm_groups" {
  type = list
  default = [
    {
      id = "explorer"
      vms = {
        "1" = {tags = "explorer"}
      }
    },
    {
      id = "lighthouse-geth"
      vms = {
        "bootnode" = {tags = "bootnode,tooling"}
        "1" = {}
        "2" = {}
        "3" = {}
        "4" = {}
        "5" = {}
        "6" = {}
        "7" = {}
        "8" = {}
        "9" = {}
        "10" = {}
        "11" = {}
        "12" = {}
      },
    },
    {
      id = "lighthouse-nethermind"
      vms = {
        "1" = {}
        "2" = {}
        "3" = {}
        "4" = {}
        "5" = {}
        "6" = {}
        "7" = {}
        "8" = {}
        "9" = {}
        "10" = {}
        "11" = {}
        "12" = {}
      }
    },
    {
      id = "lighthouse-besu"
      vms = {
        "1" = {}
        "2" = {}
        "3" = {}
        "4" = {}
        "5" = {}
        "6" = {}
      },
    },
    {
      id = "lighthouse-erigon"
      vms = {
        "1" = {}
        "2" = {}
        "3" = {}
        "4" = {}
        "5" = {}
        "6" = {}
      }
    },
    {
      id = "prysm-geth"
      vms = {
        "bootnode" = {tags = "bootnode"}
        "1" = {}
        "2" = {}
        "3" = {}
        "4" = {}
        "5" = {}
        "6" = {}
        "7" = {}
        "8" = {}
        "9" = {}
        "10" = {}
        "11" = {}
        "12" = {}
      },
    },
    {
      id = "prysm-nethermind"
      vms = {
        "1" = {}
        "2" = {}
        "3" = {}
        "4" = {}
        "5" = {}
        "6" = {}
        "7" = {}
        "8" = {}
        "9" = {}
        "10" = {}
        "11" = {}
        "12" = {}
      }
    },
    {
      id = "prysm-besu"
      vms = {
        "1" = {}
        "2" = {}
        "3" = {}
        "4" = {}
        "5" = {}
        "6" = {}
      },
    },
    {
      id = "prysm-erigon"
      vms = {
        "1" = {}
        "2" = {}
        "3" = {}
        "4" = {}
        "5" = {}
        "6" = {}
      }
    },
    {
      id = "teku-besu"
      vms = {
        "1" = {}
        "2" = {}
        "3" = {}
      },
    },
    {
      id = "teku-erigon"
      vms = {
        "1" = {}
        "2" = {}
      }
    },
    {
      id = "teku-geth"
      vms = {
        "bootnode" = {tags = "bootnode"}
        "1" = {}
        "2" = {}
        "3" = {}
        "4" = {}
        "5" = {}
      },
    },
    {
      id = "teku-nethermind"
      vms = {
        "1" = {}
        "2" = {}
        "3" = {}
        "4" = {}
        "5" = {}
      }
    },
    {
      id = "lodestar-besu"
      vms = {
        "1" = {}
        "2" = {}
      },
    },
    {
      id = "lodestar-geth"
      vms = {
        "bootnode" = {tags = "bootnode"}
        "1" = {}
        "2" = {}
        "3" = {}
        "4" = {}
        "5" = {}
        "6" = {}
      },
    },
    {
      id = "lodestar-nethermind"
      vms = {
        "1" = {}
        "2" = {}
        "3" = {}
        "4" = {}
        "5" = {}
        "6" = {}
        "7" = {}
      }
    },
    {
      id = "lodestar-erigon"
      vms = {
        "1" = {}
        "2" = {}
      }
    },
    {
      id = "lodestar-ethereumjs"
      vms = {
        "1" = {}
        "2" = {}
      }
    },
    {
      id = "nimbus-besu"
      vms = {
        "1" = {}
        "2" = {}
        "3" = {}
        "4" = {}
      },
    },
    {
      id = "nimbus-geth"
      vms = {
        "bootnode" = {tags = "bootnode"}
        "1" = {}
        "2" = {}
        "3" = {}
        "4" = {}
      },
    },
    {
      id = "nimbus-nethermind"
      vms = {
        "1" = {}
        "2" = {}
        "3" = {}
      }
    },
    {
      id = "nimbus-erigon"
      vms = {
        "1" = {}
        "2" = {}
        "3" = {}
      }
    },
    {
      id = "grandine-geth"
      vms = {
        "1" = {}
      }
    },
  ]
}

////////////////////////////////////////////////////////////////////////////////////////
//                                        LOCALS
////////////////////////////////////////////////////////////////////////////////////////


locals {
  digitalocean_default_region = "ams3"
  digitalocean_default_size   = "s-8vcpu-16gb-amd"
  digitalocean_default_image  = "debian-11-x64"
  digitalocean_global_tags = [
    "Owner:Devops",
    "EthNetwork:${var.ethereum_network}"
  ]

  # flatten vm_groups so that we can use it with for_each()
  digitalocean_vms = flatten([
    for group in var.digitalocean_vm_groups : [
      for vm_key, vm in group.vms : {
        id        = "${group.id}.${vm_key}"
        group_key = group.id
        vm_key    = vm_key

        name        = try(vm.name, "${var.ethereum_network}-${group.id}-${vm_key}")
        ssh_keys    = try(vm.ssh_keys, [data.digitalocean_ssh_key.main.fingerprint])
        region      = try(vm.region, try(group.region, local.digitalocean_default_region))
        image       = try(vm.image, local.digitalocean_default_image)
        size        = try(vm.size, local.digitalocean_default_size)
        resize_disk = try(vm.resize_disk, true)
        monitoring  = try(vm.monitoring, true)
        backups     = try(vm.backups, false)
        ipv6        = try(vm.ipv6, false)
        vpc_uuid    = try(vm.vpc_uuid, try(
          digitalocean_vpc.main[vm.region].id,
          digitalocean_vpc.main[try(group.region, local.digitalocean_default_region)].id
        ))
        tags = concat(concat(local.digitalocean_global_tags, try(split(",", vm.tags),[])),try(split(",", group.tags),[]))
      }
    ]
  ])
}

////////////////////////////////////////////////////////////////////////////////////////
//                                  DIGITALOCEAN RESOURCES
////////////////////////////////////////////////////////////////////////////////////////
data "digitalocean_project" "main" {
  name = var.digitalocean_project_name
}

data "digitalocean_ssh_key" "main" {
  name = var.digitalocean_ssh_key_name
}

resource "digitalocean_vpc" "main" {
  for_each = var.digitalocean_vpcs
  name     = try(each.value.name, "${var.ethereum_network}-${each.key}")
  region   = each.key
  ip_range = each.value.ip_range
}

resource "digitalocean_droplet" "main" {
  for_each = {
    for vm in local.digitalocean_vms : "${vm.id}" => vm
  }
  name        = each.value.name
  region      = each.value.region
  ssh_keys    = each.value.ssh_keys
  image       = each.value.image
  size        = each.value.size
  resize_disk = each.value.resize_disk
  monitoring  = each.value.monitoring
  backups     = each.value.backups
  ipv6        = each.value.ipv6
  vpc_uuid    = each.value.vpc_uuid
  tags        = each.value.tags
}

resource "digitalocean_project_resources" "droplets" {
  for_each = digitalocean_droplet.main
  project = data.digitalocean_project.main.id
  resources = [each.value.urn]
}

////////////////////////////////////////////////////////////////////////////////////////
//                          GENERATED FILES AND OUTPUTS
////////////////////////////////////////////////////////////////////////////////////////

resource "local_file" "ansible_inventory" {
  content = templatefile("ansible_inventory.tmpl",
    {
      groups = merge(
        { for group in var.digitalocean_vm_groups: "${group.id}" => true },
      )
      hosts  = merge(
        {
          for key, server in digitalocean_droplet.main: "do.${key}" => {
            ip = "${server.ipv4_address}"
            group = split(".", key)[0]
            tags = "${server.tags}"
            hostname = "${var.ethereum_network}-${split(".", key)[0]}-${split(".", key)[1]}"
            cloud  = "digitalocean"
            region = "${server.region}"
          }
        }
      )
    }
  )
  filename = "../../../${var.ethereum_network}/inventory/inventory.ini"
}