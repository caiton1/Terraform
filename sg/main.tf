provider "aws" {
    region = "us-west-1"
}

# provision ec2
resource "aws_instance" "ec2"   {
    ami = "ami-00baaa26c63140022"
    instance_type = "t2.micro" # free tier
    security_groups = [aws_security_group.webtraffic.name]
}

resource "aws_security_group" "webtraffic" {
    name = "allow HTTPS"

    ingress {
        from_port = 443
        to_port = 443
        protocol = "TCP"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port = 443
        to_port = 443
        protocol = "TCP"
        cidr_blocks = ["0.0.0.0/0"]
    }
}