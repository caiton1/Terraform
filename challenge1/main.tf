provider "aws" {
    region = "us-west-1"
}

resource "aws_vpc" "challenge1" {
    cidr_block = "192.168.0.0/24"
    tags = {
        Name = "TerraformVPC"
    }
}