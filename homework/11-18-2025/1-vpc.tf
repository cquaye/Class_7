
#https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc

# this  makes  vpc.id which is aws_vpc.app1.id

resource "aws_vpc" "southpawsat" {
  cidr_block           = "10.69.0.0/16"
  instance_tenancy     = "default"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name    = "southpawsat"
    Service = "vpc"
    Owner   = "Darth Vader"
    Planet  = "Mustafar"
  }
}

