terraform {
  backend "s3" {
    bucket = "adam-stegienko-s3"
    key    = "adam-stegienko-s3/terraform.tfstate"
    region = "eu-central-1"
  }
}

provider "aws" {
  region = "eu-central-1"
}