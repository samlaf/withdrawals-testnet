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
    key                         = "infrastructure/withdrawal-devnet-0/terraform.tfstate"
  }
}


locals {
  ssh_key_name = "barnabasbusa"
  digital_ocean_project_name = "Withdrawals"
  size = "s-4vcpu-8gb-amd"
  region = "fra1"
  image = "ubuntu-22-04-x64"
  name = "withdrawal-devnet-0"
  vpc_name="withdrawal-devnet-0"
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


module "withdrawal-devnet-0_bootnode" {
  droplet_count = 1

  size      =  local.size
  region    = local.region
  image     = local.image
  name      = "withdrawal-devnet-0-bootnode"
  source    = "../../modules/"

  tags = concat(local.shared_project_tags,["beacon","validator","teku","execution","geth","explorer","bootnode","faucet","forkmon","ethstats_server","landing_page","reverse_proxy","withdrawal-devnet-0"])
  ssh_key_name = local.ssh_key_name
  digital_ocean_project_name = local.digital_ocean_project_name
#  vpc_uuid = digitalocean_vpc.vpc.id
}


module "withdrawal-devnet-0-lighthouse-geth" {
  droplet_count = 1

  size      =  local.size
  region    = local.region
  image     = local.image
  name      = "withdrawal-devnet-0-lighthouse-geth"
  source    = "../../modules/"

  tags = concat(local.shared_project_tags,["beacon","validator","lighthouse","execution","geth","withdrawal-devnet-0"])
  ssh_key_name = local.ssh_key_name
  digital_ocean_project_name = local.digital_ocean_project_name
  #  vpc_uuid = digitalocean_vpc.vpc.id
}

module "withdrawal-devnet-0-lighthouse-nethermind" {
  droplet_count = 1

  size      =  local.size
  region    = local.region
  image     = local.image
  name      = "withdrawal-devnet-0-lighthouse-nethermind"
  source    = "../../modules/"

  tags = concat(local.shared_project_tags,["beacon","validator","lighthouse","execution","nethermind","withdrawal-devnet-0"])
  ssh_key_name = local.ssh_key_name
  digital_ocean_project_name = local.digital_ocean_project_name
  #  vpc_uuid = digitalocean_vpc.vpc.id
}

module "withdrawal-devnet-0-lighthouse-besu" {
  droplet_count = 1

  size      =  local.size
  region    = local.region
  image     = local.image
  name      = "withdrawal-devnet-0-lighthouse-besu"
  source    = "../../modules/"

  tags = concat(local.shared_project_tags,["beacon","validator","lighthouse","execution","besu","withdrawal-devnet-0"])
  ssh_key_name = local.ssh_key_name
  digital_ocean_project_name = local.digital_ocean_project_name
  #  vpc_uuid = digitalocean_vpc.vpc.id
}


module "withdrawal-devnet-0-lodestar-geth" {
  droplet_count = 1

  size      =  local.size
  region    = local.region
  image     = local.image
  name      = "withdrawal-devnet-0-lodestar-geth"
  source    = "../../modules/"

  tags = concat(local.shared_project_tags,["beacon","validator","lodestar","execution","geth","withdrawal-devnet-0"])
  ssh_key_name = local.ssh_key_name
  digital_ocean_project_name = local.digital_ocean_project_name
  #  vpc_uuid = digitalocean_vpc.vpc.id
}


module "withdrawal-devnet-0-lodestar-nethermind" {
  droplet_count = 1

  size      =  local.size
  region    = local.region
  image     = local.image
  name      = "withdrawal-devnet-0-lodestar-nethermind"
  source    = "../../modules/"

  tags = concat(local.shared_project_tags,["beacon","validator","lodestar","execution","nethermind","withdrawal-devnet-0"])
  ssh_key_name = local.ssh_key_name
  digital_ocean_project_name = local.digital_ocean_project_name
  #  vpc_uuid = digitalocean_vpc.vpc.id
}

module "withdrawal-devnet-0-lodestar-besu" {
  droplet_count = 1

  size      =  local.size
  region    = local.region
  image     = local.image
  name      = "withdrawal-devnet-0-lodestar-besu"
  source    = "../../modules/"

  tags = concat(local.shared_project_tags,["beacon","validator","lodestar","execution","besu","withdrawal-devnet-0"])
  ssh_key_name = local.ssh_key_name
  digital_ocean_project_name = local.digital_ocean_project_name
  #  vpc_uuid = digitalocean_vpc.vpc.id
}

module "withdrawal-devnet-0-teku-geth" {
  droplet_count = 1

  size      =  local.size
  region    = local.region
  image     = local.image
  name      = "withdrawal-devnet-0-teku-geth"
  source    = "../../modules/"

  tags = concat(local.shared_project_tags,["beacon","validator","teku","execution","geth","withdrawal-devnet-0"])
  ssh_key_name = local.ssh_key_name
  digital_ocean_project_name = local.digital_ocean_project_name
  #  vpc_uuid = digitalocean_vpc.vpc.id
}

module "withdrawal-devnet-0-teku-nethermind" {
  droplet_count = 1

  size      =  local.size
  region    = local.region
  image     = local.image
  name      = "withdrawal-devnet-0-teku-nethermind"
  source    = "../../modules/"

  tags = concat(local.shared_project_tags,["beacon","validator","teku","execution","nethermind","withdrawal-devnet-0"])
  ssh_key_name = local.ssh_key_name
  digital_ocean_project_name = local.digital_ocean_project_name
  #  vpc_uuid = digitalocean_vpc.vpc.id
}

module "withdrawal-devnet-0-teku-besu" {
  droplet_count = 1

  size      =  local.size
  region    = local.region
  image     = local.image
  name      = "withdrawal-devnet-0-teku-besu"
  source    = "../../modules/"

  tags = concat(local.shared_project_tags,["beacon","validator","teku","execution","besu","withdrawal-devnet-0"])
  ssh_key_name = local.ssh_key_name
  digital_ocean_project_name = local.digital_ocean_project_name
  #  vpc_uuid = digitalocean_vpc.vpc.id
}

module "withdrawal-devnet-0-prysm-geth" {
  droplet_count = 1

  size      =  local.size
  region    = local.region
  image     = local.image
  name      = "withdrawal-devnet-0-prysm-geth"
  source    = "../../modules/"

  tags = concat(local.shared_project_tags,["beacon","validator","prysm","execution","geth","withdrawal-devnet-0"])
  ssh_key_name = local.ssh_key_name
  digital_ocean_project_name = local.digital_ocean_project_name
  #  vpc_uuid = digitalocean_vpc.vpc.id
}

module "withdrawal-devnet-0-prysm-nethermind" {
  droplet_count = 1

  size      =  local.size
  region    = local.region
  image     = local.image
  name      = "withdrawal-devnet-0-prysm-nethermind"
  source    = "../../modules/"

  tags = concat(local.shared_project_tags,["beacon","validator","prysm","execution","nethermind","withdrawal-devnet-0"])
  ssh_key_name = local.ssh_key_name
  digital_ocean_project_name = local.digital_ocean_project_name
  #  vpc_uuid = digitalocean_vpc.vpc.id
}

module "withdrawal-devnet-0-prysm-besu" {
  droplet_count = 1

  size      =  local.size
  region    = local.region
  image     = local.image
  name      = "withdrawal-devnet-0-prysm-besu"
  source    = "../../modules/"

  tags = concat(local.shared_project_tags,["beacon","validator","prysm","execution","besu","withdrawal-devnet-0"])
  ssh_key_name = local.ssh_key_name
  digital_ocean_project_name = local.digital_ocean_project_name
  #  vpc_uuid = digitalocean_vpc.vpc.id
}

module "withdrawal-devnet-0-nimbus-geth" {
  droplet_count = 1

  size      =  local.size
  region    = local.region
  image     = local.image
  name      = "withdrawal-devnet-0-nimbus-geth"
  source    = "../../modules/"

  tags = concat(local.shared_project_tags,["beacon","validator","nimbus","execution","geth","withdrawal-devnet-0"])
  ssh_key_name = local.ssh_key_name
  digital_ocean_project_name = local.digital_ocean_project_name
  #  vpc_uuid = digitalocean_vpc.vpc.id
}

module "withdrawal-devnet-0-nimbus-nethermind" {
  droplet_count = 1

  size      =  local.size
  region    = local.region
  image     = local.image
  name      = "withdrawal-devnet-0-nimbus-nethermind"
  source    = "../../modules/"

  tags = concat(local.shared_project_tags,["beacon","validator","nimbus","execution","nethermind","withdrawal-devnet-0"])
  ssh_key_name = local.ssh_key_name
  digital_ocean_project_name = local.digital_ocean_project_name
  #  vpc_uuid = digitalocean_vpc.vpc.id
}

module "withdrawal-devnet-0-nimbus-besu" {
  droplet_count = 1

  size      =  local.size
  region    = local.region
  image     = local.image
  name      = "withdrawal-devnet-0-nimbus-besu"
  source    = "../../modules/"

  tags = concat(local.shared_project_tags,["beacon","validator","nimbus","execution","besu","withdrawal-devnet-0"])
  ssh_key_name = local.ssh_key_name
  digital_ocean_project_name = local.digital_ocean_project_name
  #  vpc_uuid = digitalocean_vpc.vpc.id
}

module "withdrawal-devnet-0-lodestar-ethereumjs" {
  droplet_count = 1

  size      =  local.size
  region    = local.region
  image     = local.image
  name      = "withdrawal-devnet-0-lodestar-ethereumjs"
  source    = "../../modules/"

  tags = concat(local.shared_project_tags,["beacon","validator","lodestar","execution","ethereumjs","withdrawal-devnet-0"])
  ssh_key_name = local.ssh_key_name
  digital_ocean_project_name = local.digital_ocean_project_name
  #  vpc_uuid = digitalocean_vpc.vpc.id
}