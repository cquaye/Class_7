# optupt of vpc

output "vpc" {
  value = aws_vpc.southpawsat.cidr_block
}

# output of subnets
/*
output "availability zones" {

}
*/
# output of internet gateway

output "i-gateway" {
  value = aws_internet_gateway.igw.tags
}

output "natgateway-private-ip" {
  value = aws_nat_gateway.natgw.private_ip
}

output "natgateway-public-ip" {
  value = aws_nat_gateway.natgw.public_ip
}

output "eip" {
    value = aws_eip.nat.domain
}

output "loadbalancer" {
  value = "http://${aws_lb.southpaw-lb.dns_name}"
}

output "zone-a" {
  value = aws_subnet.public_a.availability_zone
}
output "zone-b" {
  value = aws_subnet.public_b.availability_zone
}
output "zone-c" {
  value = aws_subnet.public_c.availability_zone
}