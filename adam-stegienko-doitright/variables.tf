variable "custom_ami" {
  type    = string
  default = "ami-07a512ad10d82b9e2"
}

variable "instance_size" {
  type    = string
  default = "t2.micro"
}

variable "adam_tags" {
  type = map(string)
  default = {
    bootcamp   = "poland1"
    created_by = "Adam Stegienko"
    Name       = "ADAM"
  }
}

