#############################################
resource "aws_subnet" "FT_PROD_subnet" {
  vpc_id     = data.aws_vpc.default.id
  cidr_block = "172.31.1.0/24"
  availability_zone = var.aws_AZ1
  map_public_ip_on_launch = true
  
  tags = {
    Name = "FT_PROD_subnet"
    
  }
}
#############################################
resource "aws_subnet" "FT_DEV_subnet" {
  vpc_id     = data.aws_vpc.default.id
  cidr_block = "172.31.2.0/24"
  availability_zone = var.aws_AZ1
  map_public_ip_on_launch = true
  
  tags = {
    Name = "FT_DEV_subnet"
  }
}
#############################################
resource "aws_subnet" "FT_CI_subnet" {
  vpc_id     = data.aws_vpc.default.id
  cidr_block = "172.31.3.0/24"
  availability_zone = var.aws_AZ1
  map_public_ip_on_launch = true
  
  tags = {
    Name = "FT_CI_subnet"
  }
}
#############################################
