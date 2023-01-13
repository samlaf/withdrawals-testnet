resource "cloudflare_record" "dns-entry" {
  for_each = {
    for vm in local.digitalocean_vms : "${vm.id}" => vm
  }
  zone_id = data.sops_file.cloudflare.data["zones.ethpandaops-com.zone_id"]
  name    = "${each.value.name}.${data.sops_file.cloudflare.data["zones.ethpandaops-com.domain"]}"
  type    = "A"
  value   = "${digitalocean_droplet.main[each.value.id].ipv4_address}"
  proxied = false
}