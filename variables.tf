variable "project" {
    type = string
    default = "roboshop"
  
}
variable "environment" {
    type = string
    default = "dev"
  
}
variable "vpc_cidr_block" {
    type = string
    default = "10.0.0.0/16"
}
variable "vpc_tags" {
    default = {}
    type = map
  
}