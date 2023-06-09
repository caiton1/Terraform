provider "aws" {
    region = "us-west-1"
}
# variables
variable "vpcname"  {
    type = string
    default = "testvpc"
}

variable "sshport"  {
    type = number
    default = 22
}

variable "enabled"  {
    default = true
}

variable "mylist"   {
    type = list(string)
    default = ["Value","Value2"]
}

variable "mymap"    {
    type = map
    default = {
        Key1 = "Value1"
        Key2 = "value2" 
    }
}

# this will ask for an input and prompt with description
variable "inputname"    {
    type = string
    description = "Set the name of the VPC"
}

# create a VPC
resource "aws_vpc" "testvpc" {
    cidr_block = "10.0.0.0/16"
    tags = {
        Name = var.inputname
        #Name = var.mymap["Key1"]
        #Name = var.mylist[0]
        #Name = var.vpcname
    }
}

# create an output
output "vpcteid" {
    value = aws_vpc.testvpc.id
}

variable "mytuple"  {
    type = tuple([string, number, string])
    default = ["test1", 1, "test2"]
}

variable "myobject" {
    type = object({name = string, port = list(number)})
    default = {
        name = "TJ"
        port = [22,25,80]
    }
}