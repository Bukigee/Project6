#DB
resource "aws_db_instance" "P6DB" {
  allocated_storage    = 12
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t2.micro"
  name                 = "P6DB"
  username             = "Buks"
  password             = "password"
  parameter_group_name = "default.mysql5.7"
  skip_final_snapshot  = true
  db_subnet_group_name = aws_db_subnet_group.P6DBSN.id
}


#DB Subnet
resource "aws_db_subnet_group" "P6DBSN" {
  name       = "db-subnet1"
  subnet_ids = [aws_subnet.Project6-Pri-SN1.id, aws_subnet.Project6-Pri-SN2.id]

  tags = {
    Name = "http"
  }
}



#DB Security Group
resource "aws_security_group" "Pr6-DBSG" {
  name        = "Pr6-DBSG"
  description = "Allow http inbound traffic"
  vpc_id      = aws_vpc.Project6-VPC.id
}

  resource "aws_security_group_rule" "DbSG-Inbound" {
  type              = "ingress"
  from_port         = 3306
  to_port           = 3306
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.Pr6-DBSG.id
}

resource "aws_security_group_rule" "DBSG-Outbound" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.Pr6-DBSG.id
}

