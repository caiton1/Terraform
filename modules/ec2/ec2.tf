variable "ec2name" { # input to pass variable in
    type = string
}

# provision ec2
resource "aws_instance" "ec2"   {
    ami = "ami-00baaa26c63140022"
    instance_type = "t2.micro" # free tier
    tags = {
        Name = var.ec2name
    }
}