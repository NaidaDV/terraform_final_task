#############################################
resource "aws_instance" "app_DEV" {
  ami = "${var.ami}"
  instance_type = "t2.micro"
  subnet_id = "${aws_subnet.FT_subnet.id}"
  key_name = var.auth
  security_groups = [ "${aws_security_group.FT_security_group.id}" ]
  user_data = file("script_app.sh")
  tags = {
    Name = "App_DEV"
  }
}
#############################################
resource "aws_instance" "app_PROD" {
  ami = "${var.ami}"
  instance_type = "t2.micro"
  subnet_id = "${aws_subnet.FT_subnet.id}"
  key_name = var.auth
  security_groups = [ "${aws_security_group.FT_security_group.id}" ]
  user_data = file("script_app.sh")
  tags = {
    Name = "App_PROD"
  }
}
############################################
resource "aws_instance" "ci" {
  ami = "${var.ami}"
  instance_type = "t2.micro"
  subnet_id = "${aws_subnet.FT_subnet.id}"
  key_name = var.auth
  security_groups = [ "${aws_security_group.FT_security_group.id}" ]
  user_data = file("script_ci.sh")
  tags = {
    Name = "Ci"
  }
  
  connection {
    type = "ssh"
    user        = var.ssh_user
    private_key = var.private_key_path
    host = "${self.public_ip}"
  } 
  
  provisioner "remote-exec" {
    inline = [
      "mkdir /tmp/final_task",
      "touch /tmp/final_task/environments.env",
      "echo DEV_IP_JEN_DEV=${aws_instance.app_DEV.public_ip} > /tmp/final_task/environments.env",
      "echo DEV_IP_JEN_PROD=${aws_instance.app_PROD.public_ip} >> /tmp/final_task/environments.env",
    ]
  }
}
############################################
resource "aws_instance" "loadbalancer_1" {
  ami = "${var.ami}"
  instance_type = "t2.micro"
  subnet_id = "${aws_subnet.FT_subnet.id}"
  key_name = var.auth
  security_groups = [ "${aws_security_group.FT_security_group.id}" ]
  user_data = file("script_loadbalancer.sh")
  tags = {
   Name = "Loadbalancer1"
  }


  connection {
    type = "ssh"
    user        = var.ssh_user
    private_key = var.private_key_path
    host = "${self.public_ip}"
  } 
  
  provisioner "remote-exec" {
    inline = [
      "touch /tmp/vars.yml",
      "echo application_ip: ${aws_instance.app_PROD.public_ip}:8080 > /tmp/vars.yml",
    ]
  }
}
############################################
resource "aws_instance" "loadbalancer_2" {
  ami = "${var.ami}"
  instance_type = "t2.micro"
  subnet_id = "${aws_subnet.FT_subnet.id}"
  key_name = var.auth
  security_groups = [ "${aws_security_group.FT_security_group.id}" ]
  user_data = file("script_loadbalancer.sh")
  tags = {
    Name = "Loadbalancer2"
  }


  connection {
    type = "ssh"
    user        = var.ssh_user
    private_key = var.private_key_path
    host = "${self.public_ip}"
  } 
  
  provisioner "remote-exec" {
    inline = [
      "touch /tmp/vars.yml",
      "echo application_ip: ${aws_instance.app_PROD.public_ip}:8080 > /tmp/vars.yml",
    ]
  }
}
