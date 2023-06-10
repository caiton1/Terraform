provider "aws"  {
    region = "us-west-1"
}
# variables
variable "ingressrules"  {
    type = list(number)
    default = [80,443]
}

variable "egressrules"  {
    type = list(number)
    default = [80,443]
}

# create a DB ec2 instance and out put private IP
resource "aws_instance" "DB_instance" {
    ami = "ami-00baaa26c63140022"
    instance_type = "t2.micro" # free tier
    tags = {
        Name = "DB instance"
    }
}

# create a web server and ensure it has fixed IP
resource "aws_instance" "web_server" {
    ami = "ami-00baaa26c63140022"
    instance_type = "t2.micro" 
    security_groups = [aws_security_group.webtraffic.name]
    user_data = file("server-script.sh") # execute the local script
    tags = {
        Name = "Web Server"
    }
}

# attach EIP to DB instance
resource "aws_eip" "DB_EIP" {
    instance = aws_instance.DB_instance.id
}

# create a security group for the web server with open HTTP and HTTPS ports
resource "aws_security_group" "webtraffic" {
    name = "Allow HTTPS"

    dynamic "ingress" {
        iterator = port
        for_each = var.ingressrules
        content { 
            from_port = port.value
            to_port = port.value
            protocol = "TCP"
            cidr_blocks = ["0.0.0.0/0"]
        }
    }

    dynamic "egress"  {
        iterator = port
        for_each = var.egressrules
        content { 
            from_port = port.value
            to_port = port.value
            protocol = "TCP"
            cidr_blocks = ["0.0.0.0/0"]
        }
    }
}

# output
output "web_server_ip" {
    value = aws_instance.web_server.private_ip
}

