data "aws_vpc" "prod" {
  filter {
    name   = "tag:Name"
    values = [var.vpc_name]
  }
}

data "aws_subnet_ids" "private" {
  vpc_id = data.aws_vpc.prod.id

  tags = {
    Type = var.private_subnet_tag
  }
}