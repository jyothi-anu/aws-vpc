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