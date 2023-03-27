provider "aws" {
  region = var.region
  access_key = "AKIARQLDARW6WAAXTKGS"
  secret_key = "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"
}

data "aws_ami" "ami" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  owners = ["099720109477"]
}

resource "aws_instance" "ansible_server" {
  ami           = data.aws_ami.ami.id
  instance_type = "t3.micro"
}
