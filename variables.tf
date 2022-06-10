variable "private_key" {
  default = "~/.ssh/sarwar-confluent-dev.pem"

}

variable "ansible_user" {
  default = "centos"
}

variable "instance_name" {
  default = "sarwar-cp-demo"
}

variable "ami_image" {
  default = "ami-0b850cf02cc00fdc8"
}

variable "instance_size" {
  default = "t2.2xlarge"
}

variable "key_name" {
  default = "sarwar-confluent-dev"
}

variable "region" {
  default = "eu-west-1"
}

variable "instance_owner" {
  default = "Sarwar Bhuiyan"
}

variable "security_group" {
  default = "sarwar-security-group"
}
