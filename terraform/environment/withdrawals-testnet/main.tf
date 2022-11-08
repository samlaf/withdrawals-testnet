terraform {
  required_providers {
    digitalocean = {
      source = "digitalocean/digitalocean"
      version = "~> 2.0"
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
    key                         = "infrastructure/withdrawals/terraform.tfstate"
  }
}


locals {
  ssh_key_name = "barnabasbusa"
  digital_ocean_project_name = "Consensus Infra"
  size = "s-4vcpu-8gb-amd"
  region = "fra1"
  image = "ubuntu-22-04-x64"
  name = "withdrawals"
  vpc_name="withdrawals"
  vpc_ip_range="10.100.69.0/24"
  vpc_region = "fra1"
  shared_project_tags = [
                            "Owner:Barnabas",
                        ]

}

resource "digitalocean_vpc" "vpc" {
  name = local.vpc_name
  ip_range = local.vpc_ip_range
  region = local.vpc_region
}


module "withdrawals_bootnode" {
  droplet_count = 1

  size      =  local.size
  region    = local.region
  image     = local.image
  name      = "withdrawals-bootnode"
  source    = "../../modules/"

  tags = concat(local.shared_project_tags,["beacon","validator","prysm","execution","geth","explorer","bootnode","faucet", "ethstats_server","landing_page","reverse_proxy","withdrawals"])
  ssh_key_name = local.ssh_key_name
  digital_ocean_project_name = local.digital_ocean_project_name
#  vpc_uuid = digitalocean_vpc.vpc.id
}

module "withdrawals-prysm-geth" {
  droplet_count = 1

  size      =  local.size
  region    = local.region
  image     = local.image
  name      = "withdrawals-prysm-geth"
  source    = "../../modules/"

  tags = concat(local.shared_project_tags,["beacon","validator","prysm","execution","geth","withdrawals"])
  ssh_key_name = local.ssh_key_name
  digital_ocean_project_name = local.digital_ocean_project_name
  #  vpc_uuid = digitalocean_vpc.vpc.id
}

module "withdrawals-lodestar-geth" {
  droplet_count = 1

  size      =  local.size
  region    = local.region
  image     = local.image
  name      = "withdrawals-lodestar-geth"
  source    = "../../modules/"

  tags = concat(local.shared_project_tags,["beacon","validator","lodestar","execution","geth","withdrawals"])
  ssh_key_name = local.ssh_key_name
  digital_ocean_project_name = local.digital_ocean_project_name
  #  vpc_uuid = digitalocean_vpc.vpc.id
}

module "withdrawals-prysm-nethermind" {
  droplet_count = 1

  size      =  local.size
  region    = local.region
  image     = local.image
  name      = "withdrawals-prysm-nethermind"
  source    = "../../modules/"

  tags = concat(local.shared_project_tags,["beacon","validator","prysm","execution","nethermind","withdrawals"])
  ssh_key_name = local.ssh_key_name
  digital_ocean_project_name = local.digital_ocean_project_name
  #  vpc_uuid = digitalocean_vpc.vpc.id
}

module "withdrawals-lodestar-nethermind" {
  droplet_count = 1

  size      =  local.size
  region    = local.region
  image     = local.image
  name      = "withdrawals-lodestar-nethermind"
  source    = "../../modules/"

  tags = concat(local.shared_project_tags,["beacon","validator","lodestar","execution","nethermind","withdrawals"])
  ssh_key_name = local.ssh_key_name
  digital_ocean_project_name = local.digital_ocean_project_name
  #  vpc_uuid = digitalocean_vpc.vpc.id
}
