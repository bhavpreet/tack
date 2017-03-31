variable "ami-id" {}
variable "depends-id" {}
variable "instance-type" {}
variable "key-name" {}
variable "name" {}
variable "region" {}
variable "security-group-id" {}
variable "default-group-id" {}
variable "subnet-ids" {}
variable "volume_size" {
  default = {
    ebs = 250
    root = 52
  }
}
variable "vpc-id" {}

output "depends-id" { value = "${ null_resource.dummy_dependency.id }" }
output "mongodb-ip" { value = "${ aws_instance.mongodb.private_ip }" }
