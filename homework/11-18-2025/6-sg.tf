# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group


# security group for general traffics
resource "aws_security_group" "southpaw-sg" {
  name        = "southpaw-sg"
  description = "Allow inbound traffic and all outbound traffic "
  vpc_id      = aws_vpc.southpawsat.id

  tags = {
    Name = "southpaw-sg"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_ssh" {
  description = "Allowing for ssh traffic"
  security_group_id = aws_security_group.southpaw-sg.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22

  tags = {
    Name = "ssh"
  }

}

resource "aws_vpc_security_group_ingress_rule" "allow_http" {
  description = "Allowing for http traffic"
  security_group_id = aws_security_group.southpaw-sg.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80

  tags = {
    Name = "http"
  }
  
}

resource "aws_vpc_security_group_egress_rule" "allow_sg-allow-all-ipv4" {
  security_group_id = aws_security_group.southpaw-sg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"


}



# security group for loabalancer 

resource "aws_security_group" "southpaw-lb-sg" {
  name        = "southpaw-lb-sg"
  description = "Allow inbound traffic for load balancer "
  vpc_id      = aws_vpc.southpawsat.id

  tags = {
    Name = "load balancer"
    Owner = "Darth Vader"
    Planet  = "Mustafar"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_http_lb" {
  description = "Allowing for http traffic"
  security_group_id = aws_security_group.southpaw-lb-sg.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80

  tags = {
    Name = "http"
    Owner = "Darth Vader"
    Planet  = "Mustafar"
  }
  
}

resource "aws_vpc_security_group_egress_rule" "allow_sg-allow-all-ipv4_lb" {
  security_group_id = aws_security_group.southpaw-lb-sg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"


  tags = {
    Name = "egress traffic"
    Owner = "Darth Vader"
    Planet  = "Mustafar"
  }


}