provider "aws" {
  region = "us-west-2"
  access_key = "AKIARQLDARW6QETEOI4H"
  secret_key = "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"
}
resource "aws_instance" "Test" {
    count = 2
    ami = "ami-0d2017e886fc2c0ab"
    instance_type = var.instance_type
}
output "ec2" {
 value = { for i, v in aws_instance.Test : format("public_ip%d", i + 1) => v.public_ip }
}
  
