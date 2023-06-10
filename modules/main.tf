provider "aws" {
    region = "us-west-1"
}

module "ec2module" {
    source = "./ec2"
    ec2name = "Name from module" # passing in variable 

}

output "modul_output" {
    value = module.ec2module.instance_id
}