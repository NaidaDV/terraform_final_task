#############################################
resource "aws_subnet" "FT_subnet" {
  vpc_id     = data.aws_vpc.default.id
  cidr_block = "172.31.1.0/24"
  availability_zone = var.aws_AZ1
  map_public_ip_on_launch = true
  
  tags = {
    Name = "FT_subnet"
  }
}
#############################################

