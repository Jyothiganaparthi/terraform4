provider "aws" {
  version    = "~> 4.0"
  region     = "us-east-1"
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"

}
terraform {
  backend "s3" {
    bucket = "mybucket4250"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
}
resource "aws_vpc" "example" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true
  tags = {
    Name = "Myvpc"
  }
}
resource "aws_subnet" "example" {
  vpc_id     = aws_vpc.example.id
  cidr_block = "10.0.0.0/24"
  tags = {
    Name = "subnet1"
  }
}
resource "aws_internet_gateway" "example" {
  vpc_id = aws_vpc.example.id
  tags = {
  Name = "igw" }
}
resource "aws_route_table" "example" {
  vpc_id = aws_vpc.example.id
route{
cidr_block = "0.0.0.0/0"
gateway_id = aws_internet_gateway.example.id
}
  tags = {
    Name = "route1"
  }
  }
resource "aws_route_table_association" "example" {
  subnet_id      = aws_subnet.example.id
  route_table_id = aws_route_table.example.id
} 
resource "aws_security_group" "example"{
name= "sg1"
vpc_id = aws_vpc.example.id
ingress{
description      = "From vpc"
    from_port        = 22
    to_port          = 22
    protocol         = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
}
egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
}
tags ={
name = "sg1"
}
}

output "vpcname" {
  value = aws_vpc.example.tags.Name
}
output "vpcid" {
  value = aws_vpc.example.id
}
