output "ec2-instances-public-ip" {
  description = "Public ip addresses of the spun up ec2 instances"
  value = [ for instance in module.withdrawal-devnet-0-ec2-instances: instance.public_ip ]
}

# TODO: use make this work.. can't find a way to get the name of the instance
# output "ec2-instances-public-ip-map" {
#   description = "Public ip addresses of the spun up ec2 instances"
#   value = { for instance in module.withdrawal-devnet-0-ec2-instances: instance.name => instance.public_ip }
# }