variable "cloudflare-zones" {
  default = {
    ethpandaops-com = {
      zone : "b9d2de91b01fbd27cfd264fe8d3a182b"
      domain : "ethpandaops.com"
    }
  }
}

provider "cloudflare" {
  api_token = var.cloudflare_api_token
}

variable "cloudflare_api_token" {
  type        = string
  sensitive   = true
  description = "Cloudflare API Token"
}

data "sops_file" "cloudflare" {
  source_file = "../../../../../ethPandaOps/secrets/cloudflare.enc.yaml"
}