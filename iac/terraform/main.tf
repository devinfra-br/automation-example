variable "region" {
  default = "us-east-1"
}

provider "aws" {
  version = "~> 3.0"
  region  = var.region
  shared_credentials_file = "/root/.aws/credentials"
  profile = "default"
}

resource "aws_instance" "web" {
  ami           = "ami-0bc556e0c71e1b467"
  instance_type = "t2.micro"
  associate_public_ip_address = true
  key_name = "deploy"

  tags = {
    Name = "Teste Resource"
  }
}