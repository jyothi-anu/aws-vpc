variable "project" {
    type = string
}
variable "environment" {
    type = string
}
variable "vpc_cidr_block" {
    type = string
    default = "10.0.0.0/16"
}
variable "vpc_tags" {
    default = {}
    type = map
}
variable "igw_tags" {
    default = {}
    type = map 
}
variable "public_subnets_cidr" {
    type = list(string)
    default = [ "10.0.1.0/24","10.0.2.0/24" ]
}
variable "public_subnet_tags" {
    default = {}
    type = map
}