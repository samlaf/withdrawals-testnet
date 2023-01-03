locals {
  ethpandaops = var.cloudflare-zones["ethpandaops-com"]
}

resource "cloudflare_record" "dns-entry" {
  for_each = {
    for vm in local.digitalocean_vms : "${vm.id}" => vm
  }
  zone_id = local.ethpandaops.zone
  name    = "${each.value.name}.${local.ethpandaops.domain}"
  type    = "A"
  value   = "${digitalocean_droplet.main[each.value.id].ipv4_address}"
  proxied = false
}