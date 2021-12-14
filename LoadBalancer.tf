resource "aws_lb" "Proj6-LB" {
  name               = "Proje6-LB"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.Pr6-SG.id]
  subnets            = [ aws_subnet.Project6-Pub-SN1.id, aws_subnet.Project6-Pub-SN2.id]

  enable_deletion_protection = true

}

#LB Target Group
resource "aws_lb_target_group" "P6-LBTG" {
  name     = "P6-lb-TG1"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.Project6-VPC.id
}

#LB Listener
resource "aws_lb_listener" "P6-LBL" {
  load_balancer_arn = aws_lb.Proj6-LB.arn
  port              = "80"
  protocol          = "HTTP"
 
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.P6-LBTG.arn
  }
}