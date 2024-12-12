variable "env" {
  description = "this is environment name eg. dev/stg/prd"
  type = string
}

variable "instance_type" {
  description = "this is the instance type for ec2 t2.micro/t2.medium/t2.small"
  type = string
}

variable "instance_count" {
  description = "this is the variable count i need"
  type = number
}

variable "ami" {
  description = "this is the ami id"
  type = string
}

variable "volume_size" {
  description = "this is the size of root ebs for ec2 "
  type = number
}
