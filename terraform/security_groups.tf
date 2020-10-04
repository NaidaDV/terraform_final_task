###############################################
resource "aws_security_group" "FT_security_group" {
  name        = "FT_security_group"
  description = "Allow traffic on port 80, 3306 + ICMP and SSH for checks"
  vpc_id      = data.aws_vpc.default.id
  ingress {
    description = "Allow http traffic on port 80"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "Allow ssh traffic on port 22"
    from_port   = 22
    to_port     = 22 
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]              
  }
  ingress {
    description = "Allow ICMP traffic"
    from_port   = "-1"
    to_port     = "-1"
    protocol    = "icmp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "Allow traffic on port 8080"
    from_port   = 8080 
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]              
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "FT_security_group"
  }
}
