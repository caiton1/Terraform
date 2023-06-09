provider "aws" {
    region = "us-west-1"
}

# provision ec2
resource "aws_instance" "ec2"   {
    ami = "ami-00baaa26c63140022" # region secific
    instance_type = "t2.micro" # free tier
}

# setup elastic ip
resource "aws_eip" "elasticIP" {
    instance = aws_instance.ec2.id
}

# output ip
output "EIP" {
    value = aws_eip.elasticIP.public_ip
}