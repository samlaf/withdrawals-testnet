terraform {
  cloud {
    organization = "Layr-Labs"

    workspaces {
      name = "ansible-devnet-test-samlaf"
    }
  }
}

provider "aws" {
  region = local.aws_region
}

locals {
  aws_region = "us-east-1"
  name       = "withdrawal-devnet-0"
}

module "withdrawal-devnet-0-ec2-instances" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 3.0"

  for_each = toset(["bootnode", "lighthouse-geth", "teku-nethermind"])
  name     = "${local.name}-${each.key}"

  ami                    = "ami-0fec2c2e2017f4e7b" // debian-11-amd64-20230124-1270
  instance_type          = "t2.small"
  key_name               = "samlaf"
  vpc_security_group_ids = [module.security_group.security_group_id]
  # Use the default vpc and subnet for now
  # subnet_id              = "subnet-eddcdzz4"

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}

module "security_group" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "~> 4.0"

  name        = local.name
  description = "Security group for EC2 instances running EL+CL nodes"
  # vpc_id      = module.vpc.vpc_id

  # See in all.yaml for list of all ports that need to be open
  # we start with just 30303 which is minimum to get p2p working
  # TODO: try by manually allowing all traffic first.. see if that works.
  ingress_with_cidr_blocks = [
    {
      from_port   = 30303
      to_port     = 30303
      protocol    = "tcp"
      description = "EL p2p port"
      cidr_blocks = "0.0.0.0/0"
    },
    {
      from_port   = 9000 // from_port is not the port of the source, but from/to form a range of allowed ports
      to_port     = 9000
      protocol    = "tcp"
      description = "CL p2p port"
      cidr_blocks = "0.0.0.0/0"
    },
    {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      description = "SSH"
      cidr_blocks = "0.0.0.0/0"
    }
  ]
  egress_with_cidr_blocks = [{
    from_port   = 0
    to_port     = 0
    protocol    = "all"
    description = "all traffic"
    cidr_blocks = "0.0.0.0/0"
  }]
}

# TODO: the ec2 instances come with 8GB of storage, which seems enough for now,
#       but at some point we might need more
# resource "aws_volume_attachment" "this" {
#   device_name = "/dev/sdh"
#   volume_id   = aws_ebs_volume.this.id
#   instance_id = module.ec2.id
# }

# resource "aws_ebs_volume" "this" {
#   availability_zone = local.availability_zone
#   size              = 50

#   tags = local.tags
# }

