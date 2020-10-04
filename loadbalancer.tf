###############################################
resource "aws_elb" "test" {
  name               = "intermine-loadbalancer"
  security_groups    = [aws_security_group.FT_security_group.id]
  subnets            = [aws_subnet.FT_subnet.id]

  listener {
    instance_port     = 80
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }
  
  instances                   = [aws_instance.loadbalancer_1.id, aws_instance.loadbalancer_2.id]
  cross_zone_load_balancing   = false
  idle_timeout                = 400
  connection_draining         = true
  connection_draining_timeout = 400

  tags = {
    Environment = "production"
  }
}
