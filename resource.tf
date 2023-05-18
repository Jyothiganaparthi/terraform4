resource "aws_vpc" "example" {
  cidr_block           = var.cidr
  enable_dns_hostnames = var.enable
  tags = {
    Name = var.vpc_name
  }
}
