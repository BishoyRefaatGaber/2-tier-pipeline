output "ec2-public-ip-us-east-1a" {
  description = "get the public ip"
  value       = module.ec2-public-us-east-1a.ec2-public-ip
}
output "ec2-public-ip-us-east-1b" {
  description = "get the public ip"
  value       = module.ec2-public-us-east-1b.ec2-public-ip
}

output "private-nlb-dns"{
  description = "get the private nlb dns"
  value = module.nlb-private.nlb-dns
}
# output "ec2-private-ip-us-east-1b" {
#   description = "get the public ip"
#   value       = module.ec2-private-us-east-1b.ec2-private-ip
# }
# output "ec2-private-ip-us-east-1a" {
#   description = "get the public ip"
#   value       = module.ec2-private-us-east-1a.ec2-private-ip

# }