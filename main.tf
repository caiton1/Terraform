# install aws cli and run aws config to configure to account (don't want keys in plaintext on code)

provider "aws" {
    region = "us-west-1"
}

resource "aws_vpc" "testvpc" {
    cidr_block = "10.0.0.0/16"
}
