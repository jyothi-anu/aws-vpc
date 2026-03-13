resource "aws_vpc" "main" {
  cidr_block       = var.vpc_cidr_block
  instance_tenancy = "default"
  enable_dns_hostnames = true

  tags = local.vpc_final_tags
    
}
resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id

  tags = local.igw_final_tags
}
resource "aws_subnet" "public" {
  vpc_id     = aws_vpc.main.id
  count     = length(var.public_subnets_cidr)
  cidr_block = var.public_subnets_cidr[count.index]
  availability_zone = local.az_names[count.index]
  map_public_ip_on_launch = true

  tags = merge(
    local.common_tags,
    {
        #roboshop-dev-public-us-east-1a
        Name ="${var.project}-${var.environment}-public-${local.az_names[count.index]}"
    },
    var.public_subnet_tags
  )
}
resource "aws_subnet" "private" {
  vpc_id     = aws_vpc.main.id
  count     = length(var.private_subnets_cidr)
  cidr_block = var.private_subnets_cidr[count.index]
  availability_zone = local.az_names[count.index]

  tags = merge(
    local.common_tags,
    {
        #roboshop-dev-private-us-east-1a
        Name ="${var.project}-${var.environment}-private-${local.az_names[count.index]}"
    },
    var.private_subnet_tags
  )
}
 resource "aws_subnet" "database" {
  vpc_id     = aws_vpc.main.id
  count     = length(var.database_subnets_cidr)
  cidr_block = var.database_subnets_cidr[count.index]
  availability_zone = local.az_names[count.index]

  tags = merge(
         local.common_tags,
         {
        #roboshop-dev-database-us-east-1a
             Name ="${var.project}-${var.environment}-database-${local.az_names[count.index]}"
         },
         var.database_subnet_tags
  )
 }

 