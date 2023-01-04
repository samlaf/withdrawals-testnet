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
    key                         = "infrastructure/withdrawal-devnet-1/terraform.tfstate"
  }
}


locals {
  ssh_key_name = "shared-devops-eth2"
  digital_ocean_project_name = "Withdrawals"
  size = "s-4vcpu-8gb-amd"
  region = "fra1"
  image = "ubuntu-22-04-x64"
  name = "withdrawal-devnet-1"
  vpc_name="withdrawal-devnet-1"
  vpc_ip_range="10.100.71.0/24"
  vpc_region = "fra1"
  shared_project_tags = [
                            "Owner:Parithosh",
                        ]

}

resource "digitalocean_vpc" "vpc" {
  name = local.vpc_name
  ip_range = local.vpc_ip_range
  region = local.vpc_region
}


module "withdrawal-devnet-1_bootnode" {
  droplet_count = 1

  size      = "s-8vcpu-16gb-amd"
  region    = local.region
  image     = local.image
  name      = "withdrawal-devnet-1-bootnode"
  source    = "../../modules/"

  tags = concat(local.shared_project_tags,["beacon","validator","teku","execution","geth","explorer","bootnode","faucet","forkmon","ethstats_server","txfuzz","landing_page","reverse_proxy","withdrawal-devnet-1"])
  ssh_key_name = local.ssh_key_name
  digital_ocean_project_name = local.digital_ocean_project_name
#  vpc_uuid = digitalocean_vpc.vpc.id
}

module "withdrawal-devnet-1_explorer" {
  droplet_count = 1

  size      = "s-8vcpu-16gb-amd"
  region    = local.region
  image     = local.image
  name      = "withdrawal-devnet-1-explorer"
  source    = "../../modules/"

  tags = concat(local.shared_project_tags,["explorer","beaconchain_explorer","withdrawal-devnet-1"])
  ssh_key_name = local.ssh_key_name
  digital_ocean_project_name = local.digital_ocean_project_name
#  vpc_uuid = digitalocean_vpc.vpc.id
}

module "withdrawal-devnet-1-lighthouse-geth" {
  droplet_count = 1

  size      =  local.size
  region    = local.region
  image     = local.image
  name      = "withdrawal-devnet-1-lighthouse-geth"
  source    = "../../modules/"

  tags = concat(local.shared_project_tags,["beacon","validator","lighthouse","execution","geth","withdrawal-devnet-1"])
  ssh_key_name = local.ssh_key_name
  digital_ocean_project_name = local.digital_ocean_project_name
  #  vpc_uuid = digitalocean_vpc.vpc.id
}

module "withdrawal-devnet-1-lighthouse-nethermind" {
  droplet_count = 1

  size      =  local.size
  region    = local.region
  image     = local.image
  name      = "withdrawal-devnet-1-lighthouse-nethermind"
  source    = "../../modules/"

  tags = concat(local.shared_project_tags,["beacon","validator","lighthouse","execution","nethermind","withdrawal-devnet-1"])
  ssh_key_name = local.ssh_key_name
  digital_ocean_project_name = local.digital_ocean_project_name
  #  vpc_uuid = digitalocean_vpc.vpc.id
}

module "withdrawal-devnet-1-lighthouse-besu" {
  droplet_count = 1

  size      =  local.size
  region    = local.region
  image     = local.image
  name      = "withdrawal-devnet-1-lighthouse-besu"
  source    = "../../modules/"

  tags = concat(local.shared_project_tags,["beacon","validator","lighthouse","execution","besu","withdrawal-devnet-1"])
  ssh_key_name = local.ssh_key_name
  digital_ocean_project_name = local.digital_ocean_project_name
  #  vpc_uuid = digitalocean_vpc.vpc.id
}


module "withdrawal-devnet-1-lodestar-geth" {
  droplet_count = 1

  size      =  local.size
  region    = local.region
  image     = local.image
  name      = "withdrawal-devnet-1-lodestar-geth"
  source    = "../../modules/"

  tags = concat(local.shared_project_tags,["beacon","validator","lodestar","execution","geth","withdrawal-devnet-1"])
  ssh_key_name = local.ssh_key_name
  digital_ocean_project_name = local.digital_ocean_project_name
  #  vpc_uuid = digitalocean_vpc.vpc.id
}


module "withdrawal-devnet-1-lodestar-nethermind" {
  droplet_count = 1

  size      =  local.size
  region    = local.region
  image     = local.image
  name      = "withdrawal-devnet-1-lodestar-nethermind"
  source    = "../../modules/"

  tags = concat(local.shared_project_tags,["beacon","validator","lodestar","execution","nethermind","withdrawal-devnet-1"])
  ssh_key_name = local.ssh_key_name
  digital_ocean_project_name = local.digital_ocean_project_name
  #  vpc_uuid = digitalocean_vpc.vpc.id
}

module "withdrawal-devnet-1-lodestar-besu" {
  droplet_count = 1

  size      =  local.size
  region    = local.region
  image     = local.image
  name      = "withdrawal-devnet-1-lodestar-besu"
  source    = "../../modules/"

  tags = concat(local.shared_project_tags,["beacon","validator","lodestar","execution","besu","withdrawal-devnet-1"])
  ssh_key_name = local.ssh_key_name
  digital_ocean_project_name = local.digital_ocean_project_name
  #  vpc_uuid = digitalocean_vpc.vpc.id
}

module "withdrawal-devnet-1-teku-geth" {
  droplet_count = 7

  size      =  local.size
  region    = local.region
  image     = local.image
  name      = "withdrawal-devnet-1-teku-geth"
  source    = "../../modules/"

  tags = concat(local.shared_project_tags,["beacon","validator","teku","execution","geth","withdrawal-devnet-1"])
  ssh_key_name = local.ssh_key_name
  digital_ocean_project_name = local.digital_ocean_project_name
  #  vpc_uuid = digitalocean_vpc.vpc.id
}

module "withdrawal-devnet-1-teku-nethermind" {
  droplet_count = 7

  size      =  local.size
  region    = local.region
  image     = local.image
  name      = "withdrawal-devnet-1-teku-nethermind"
  source    = "../../modules/"

  tags = concat(local.shared_project_tags,["beacon","validator","teku","execution","nethermind","withdrawal-devnet-1"])
  ssh_key_name = local.ssh_key_name
  digital_ocean_project_name = local.digital_ocean_project_name
  #  vpc_uuid = digitalocean_vpc.vpc.id
}

module "withdrawal-devnet-1-teku-besu" {
  droplet_count = 1

  size      =  local.size
  region    = local.region
  image     = local.image
  name      = "withdrawal-devnet-1-teku-besu"
  source    = "../../modules/"

  tags = concat(local.shared_project_tags,["beacon","validator","teku","execution","besu","withdrawal-devnet-1"])
  ssh_key_name = local.ssh_key_name
  digital_ocean_project_name = local.digital_ocean_project_name
  #  vpc_uuid = digitalocean_vpc.vpc.id
}

module "withdrawal-devnet-1-prysm-geth" {
  droplet_count = 1

  size      =  local.size
  region    = local.region
  image     = local.image
  name      = "withdrawal-devnet-1-prysm-geth"
  source    = "../../modules/"

  tags = concat(local.shared_project_tags,["beacon","validator","prysm","execution","geth","withdrawal-devnet-1"])
  ssh_key_name = local.ssh_key_name
  digital_ocean_project_name = local.digital_ocean_project_name
  #  vpc_uuid = digitalocean_vpc.vpc.id
}

module "withdrawal-devnet-1-prysm-nethermind" {
  droplet_count = 1

  size      =  local.size
  region    = local.region
  image     = local.image
  name      = "withdrawal-devnet-1-prysm-nethermind"
  source    = "../../modules/"

  tags = concat(local.shared_project_tags,["beacon","validator","prysm","execution","nethermind","withdrawal-devnet-1"])
  ssh_key_name = local.ssh_key_name
  digital_ocean_project_name = local.digital_ocean_project_name
  #  vpc_uuid = digitalocean_vpc.vpc.id
}

module "withdrawal-devnet-1-prysm-besu" {
  droplet_count = 1

  size      =  local.size
  region    = local.region
  image     = local.image
  name      = "withdrawal-devnet-1-prysm-besu"
  source    = "../../modules/"

  tags = concat(local.shared_project_tags,["beacon","validator","prysm","execution","besu","withdrawal-devnet-1"])
  ssh_key_name = local.ssh_key_name
  digital_ocean_project_name = local.digital_ocean_project_name
  #  vpc_uuid = digitalocean_vpc.vpc.id
}

module "withdrawal-devnet-1-nimbus-geth" {
  droplet_count = 1

  size      =  local.size
  region    = local.region
  image     = local.image
  name      = "withdrawal-devnet-1-nimbus-geth"
  source    = "../../modules/"

  tags = concat(local.shared_project_tags,["beacon","validator","nimbus","execution","geth","withdrawal-devnet-1"])
  ssh_key_name = local.ssh_key_name
  digital_ocean_project_name = local.digital_ocean_project_name
  #  vpc_uuid = digitalocean_vpc.vpc.id
}

module "withdrawal-devnet-1-nimbus-nethermind" {
  droplet_count = 1

  size      =  local.size
  region    = local.region
  image     = local.image
  name      = "withdrawal-devnet-1-nimbus-nethermind"
  source    = "../../modules/"

  tags = concat(local.shared_project_tags,["beacon","validator","nimbus","execution","nethermind","withdrawal-devnet-1"])
  ssh_key_name = local.ssh_key_name
  digital_ocean_project_name = local.digital_ocean_project_name
  #  vpc_uuid = digitalocean_vpc.vpc.id
}

module "withdrawal-devnet-1-nimbus-besu" {
  droplet_count = 1

  size      =  local.size
  region    = local.region
  image     = local.image
  name      = "withdrawal-devnet-1-nimbus-besu"
  source    = "../../modules/"

  tags = concat(local.shared_project_tags,["beacon","validator","nimbus","execution","besu","withdrawal-devnet-1"])
  ssh_key_name = local.ssh_key_name
  digital_ocean_project_name = local.digital_ocean_project_name
  #  vpc_uuid = digitalocean_vpc.vpc.id
}

module "withdrawal-devnet-1-lodestar-ethereumjs" {
  droplet_count = 1

  size      =  local.size
  region    = local.region
  image     = local.image
  name      = "withdrawal-devnet-1-lodestar-ethereumjs"
  source    = "../../modules/"

  tags = concat(local.shared_project_tags,["beacon","validator","lodestar","execution","ethereumjs","withdrawal-devnet-1"])
  ssh_key_name = local.ssh_key_name
  digital_ocean_project_name = local.digital_ocean_project_name
  #  vpc_uuid = digitalocean_vpc.vpc.id
}

module "withdrawal-devnet-1-lighthouse-erigon" {
  droplet_count = 1

  size      = local.size
  region    = local.region
  image     = local.image
  name      = "withdrawal-devnet-1-lighthouse-erigon"
  source    = "../../modules/"

  tags = concat(local.shared_project_tags,["beacon","validator","lighthouse","execution","erigon","withdrawal-devnet-1"])
  ssh_key_name = "barnabasbusa"
  digital_ocean_project_name = local.digital_ocean_project_name
  #  vpc_uuid = digitalocean_vpc.vpc.id
}

module "withdrawal-devnet-1-nimbus-erigon" {
  droplet_count = 1

  size      = local.size
  region    = local.region
  image     = local.image
  name      = "withdrawal-devnet-1-nimbus-erigon"
  source    = "../../modules/"

  tags = concat(local.shared_project_tags,["beacon","validator","nimbus","execution","erigon","withdrawal-devnet-1"])
  ssh_key_name = "barnabasbusa"
  digital_ocean_project_name = local.digital_ocean_project_name
  #  vpc_uuid = digitalocean_vpc.vpc.id
}

module "withdrawal-devnet-1-prysm-erigon" {
  droplet_count = 1

  size      = local.size
  region    = local.region
  image     = local.image
  name      = "withdrawal-devnet-1-prysm-erigon"
  source    = "../../modules/"

  tags = concat(local.shared_project_tags,["beacon","validator","prysm","execution","erigon","withdrawal-devnet-1"])
  ssh_key_name = "barnabasbusa"
  digital_ocean_project_name = local.digital_ocean_project_name
  #  vpc_uuid = digitalocean_vpc.vpc.id
}

module "withdrawal-devnet-1-teku-erigon" {
  droplet_count = 1

  size      = local.size
  region    = local.region
  image     = local.image
  name      = "withdrawal-devnet-1-teku-erigon"
  source    = "../../modules/"

  tags = concat(local.shared_project_tags,["beacon","validator","teku","execution","erigon","withdrawal-devnet-1"])
  ssh_key_name = "barnabasbusa"
  digital_ocean_project_name = local.digital_ocean_project_name
  #  vpc_uuid = digitalocean_vpc.vpc.id
}

module "withdrawal-devnet-1-lodestar-erigon" {
  droplet_count = 1

  size      = local.size
  region    = local.region
  image     = local.image
  name      = "withdrawal-devnet-1-lodestar-erigon"
  source    = "../../modules/"

  tags = concat(local.shared_project_tags,["beacon","validator","lodestar","execution","erigon","withdrawal-devnet-1"])
  ssh_key_name = "barnabasbusa"
  digital_ocean_project_name = local.digital_ocean_project_name
  #  vpc_uuid = digitalocean_vpc.vpc.id
}