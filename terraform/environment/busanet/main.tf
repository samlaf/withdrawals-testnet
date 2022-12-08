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
    key                         = "infrastructure/busanet/terraform.tfstate"
  }
}


locals {
  ssh_key_name = "barnabasbusa"
  digital_ocean_project_name = "Consensus Infra"
  size = "s-4vcpu-8gb-amd"
  region = "fra1"
  image = "ubuntu-22-04-x64"
  name = "busanet"
  vpc_name="busanet"
  vpc_ip_range="10.100.70.0/24"
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


module "busanet_bootnode" {
  droplet_count = 1

  size      =  local.size
  region    = local.region
  image     = local.image
  name      = "busanet-bootnode"
  source    = "../../modules/"

  tags = concat(local.shared_project_tags,["beacon","validator","lodestar","execution","geth","explorer","bootnode","faucet", "ethstats_server","landing_page","reverse_proxy","busanet"])
  ssh_key_name = local.ssh_key_name
  digital_ocean_project_name = local.digital_ocean_project_name
#  vpc_uuid = digitalocean_vpc.vpc.id
}

module "busanet-lighthouse-geth" {
  droplet_count = 1

  size      =  local.size
  region    = local.region
  image     = local.image
  name      = "busanet-lighthouse-geth"
  source    = "../../modules/"

  tags = concat(local.shared_project_tags,["beacon","validator","lighthouse","execution","geth","busanet"])
  ssh_key_name = local.ssh_key_name
  digital_ocean_project_name = local.digital_ocean_project_name
  #  vpc_uuid = digitalocean_vpc.vpc.id
}

module "busanet-lodestar-nethermind" {
  droplet_count = 1

  size      =  local.size
  region    = local.region
  image     = local.image
  name      = "busanet-lodestar-nethermind"
  source    = "../../modules/"

  tags = concat(local.shared_project_tags,["beacon","validator","lodestar","execution","nethermind","busanet"])
  ssh_key_name = local.ssh_key_name
  digital_ocean_project_name = local.digital_ocean_project_name
  #  vpc_uuid = digitalocean_vpc.vpc.id
}

module "busanet-lodestar-besu" {
  droplet_count = 1

  size      =  local.size
  region    = local.region
  image     = local.image
  name      = "busanet-lodestar-besu"
  source    = "../../modules/"

  tags = concat(local.shared_project_tags,["beacon","validator","lodestar","execution","besu","busanet"])
  ssh_key_name = local.ssh_key_name
  digital_ocean_project_name = local.digital_ocean_project_name
  #  vpc_uuid = digitalocean_vpc.vpc.id
}

module "busanet-teku-geth" {
  droplet_count = 1

  size      =  local.size
  region    = local.region
  image     = local.image
  name      = "busanet-teku-geth"
  source    = "../../modules/"

  tags = concat(local.shared_project_tags,["beacon","validator","teku","execution","geth","busanet"])
  ssh_key_name = local.ssh_key_name
  digital_ocean_project_name = local.digital_ocean_project_name
  #  vpc_uuid = digitalocean_vpc.vpc.id
}