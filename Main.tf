#VPC
resource "aws_vpc" "Project6-VPC" {
  cidr_block           = var.vpc_cidr_block
  instance_tenancy     = "default"
  enable_dns_hostnames = true

  tags = {
    Name = "Project6-VPC"
  }
}

#SNPri
resource "aws_subnet" "Project6-Pri-SN1" {
  vpc_id     = aws_vpc.Project6-VPC.id
  cidr_block = var.PrivSN_cidr_block
  availability_zone = "eu-west-1a"

  tags = {
    Name = "Project6-Pri-SN1"
  }
}

resource "aws_subnet" "Project6-Pri-SN2" {
  vpc_id     = aws_vpc.Project6-VPC.id
  cidr_block = var.PrivSN2_cidr_block
   availability_zone = "eu-west-1c"

  tags = {
    Name = "Project6-Pri-SN2"
  }
}

#SNPub
resource "aws_subnet" "Project6-Pub-SN1" {
  vpc_id            = aws_vpc.Project6-VPC.id
  cidr_block        = var.PubSN_cidr_block
  availability_zone = "eu-west-1a"

  tags = {
    Name = "Project6-Pub-SN1"
  }
}

resource "aws_subnet" "Project6-Pub-SN2" {
  vpc_id            = aws_vpc.Project6-VPC.id
  cidr_block        = var.PubSN2_cidr_block
  availability_zone = "eu-west-1b"

  tags = {
    Name = "Project6-Pub-SN2"
  }
}


#PubRT
resource "aws_route_table" "Project6-PubRT" {
  vpc_id = aws_vpc.Project6-VPC.id

  route = []

  tags = {
    Name = "Project6-PubRT"
  }
}

#PriRT
resource "aws_route_table" "Project6-PriRT" {
  vpc_id = aws_vpc.Project6-VPC.id

  route = []

  tags = {
    Name = "Project6-PriRT"
  }
}

#IGW
resource "aws_internet_gateway" "Project6-IGW" {
  vpc_id = aws_vpc.Project6-VPC.id

  tags = {
    Name = "Project6-IGW"
  }
}

#IGW-RT Association
resource "aws_route" "Pro6IGW-PUBRT" {
  route_table_id         = aws_route_table.Project6-PubRT.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.Project6-IGW.id
}


#PubRT-SN Association
resource "aws_route_table_association" "PubRT-PubSN-Asso" {
  subnet_id      = aws_subnet.Project6-Pub-SN1.id
  route_table_id = aws_route_table.Project6-PubRT.id
}
resource "aws_route_table_association" "PubRT-PubSN2-Asso" {
  subnet_id      = aws_subnet.Project6-Pub-SN2.id
  route_table_id = aws_route_table.Project6-PubRT.id
}

#PriRT-SN Association
resource "aws_route_table_association" "PriRT-PriSN-Asso" {
  subnet_id      = aws_subnet.Project6-Pri-SN1.id
  route_table_id = aws_route_table.Project6-PriRT.id
}