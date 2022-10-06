variable "ec2_name" {
  type    = string
  default = "web_server"
}

variable "cidr" {
  type    = list(string)
  default = ["10.10.0.0/28", "10.10.0.192/28", ]
}

variable "ipv4_range" {
  type    = list(string)
  default = ["10.10.0.0/24", "0.0.0.0/0"]
}

variable "availability_zones" {
  type    = list(string)
  default = ["eu-central-1a", "eu-central-1b"]
}

variable "init_file" {
  type    = string
  default = "./docker-init.sh"
}

variable "protocols" {
  type    = list(string)
  default = ["HTTP", "TCP"]
}

variable "def_port" {
  type    = number
  default = 80
}