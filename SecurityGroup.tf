resource "aws_security_group" "Pr6-SG" {
  name        = "Pr6-SG"
  description = "Allow SSH and HTTP access"
  vpc_id      = aws_vpc.Project6-VPC.id

  ingress {
    description      = "SSH from VPC"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    
  }

  ingress {
    description      = "HTTP from VPC"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    
  }


  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    
  }

  tags = {
    Name = "Pr6-SG"
  }
}