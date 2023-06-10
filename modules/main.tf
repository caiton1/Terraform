provider "aws" {
    region = "us-west-1"
}

module "ec2module" {
    source = "./ec2"
    ec2name = "Name from module" # passing in variable 
}