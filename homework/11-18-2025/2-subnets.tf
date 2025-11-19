#https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet


################# Pubic subnets ##############################
resource "aws_subnet" "public_a" {
  vpc_id                  = aws_vpc.southpawsat.id
  cidr_block              = "10.69.1.0/24"
  availability_zone       = "us-west-2a"
  map_public_ip_on_launch = true

  tags = {
    Name = "Public-subnet-us-west-2a"
  }
}

resource "aws_subnet" "public_b" {
  vpc_id                  = aws_vpc.southpawsat.id
  cidr_block              = "10.69.2.0/24"
  availability_zone       = "us-west-2b"
  map_public_ip_on_launch = true

  tags = {
    Name = "Public-subnet-us-west-2b"
  }
}

resource "aws_subnet" "public_c" {
  vpc_id                  = aws_vpc.southpawsat.id
  cidr_block              = "10.69.3.0/24"
  availability_zone       = "us-west-2c"
  map_public_ip_on_launch = true

  tags = {
    Name = "Public-subnet-us-west-2c"
  }
}


################## Private subnets ##########################

resource "aws_subnet" "private_a" {
  vpc_id            = aws_vpc.southpawsat.id
  cidr_block        = "10.69.110.0/24"
  availability_zone = "us-west-2a"


  tags = {
    Name = "Private-subnet-us-west-2a"
  }
}

resource "aws_subnet" "private_b" {
  vpc_id            = aws_vpc.southpawsat.id
  cidr_block        = "10.69.120.0/24"
  availability_zone = "us-west-2b" 


  tags = {
    Name = "Private-subnet-us-west-2b"
  }
}

resource "aws_subnet" "private_c" {
  vpc_id            = aws_vpc.southpawsat.id
  cidr_block        = "10.69.130.0/24"
  availability_zone = "us-west-2c"


  tags = {
    Name = "Private-subnet-us-west-2c"
  }
}