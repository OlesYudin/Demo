# Build 2 AWS instant for Demo

provider "aws" {
    region = "us-east-2" # instant region
}

resource "aws_instance" "webserver" {
    ami = "ami-074cce78125f09d61" # ubuntu-18.04
    instance_type = "t2.micro" # instant params
    vpc_security_group_ids = [aws_security_group.demo_sec_group.id]
    user_data = file("./shell/website.sh")

    tags = {
        Name = "Webserver-terraform"
        Owner = "Student"
        Project = "Demo DevOps-SS-2021"
        Description = "Apache2, GitHub repo in server"
    }
}

resource "aws_instance" "jenkins" {
    ami = "ami-074cce78125f09d61" # ubuntu-18.04
    instance_type = "t2.micro" # instant params
    vpc_security_group_ids = [aws_security_group.demo_sec_group.id]
    user_data = file("./shell/jenkins.sh")

    tags = {
        Name = "Jenkins-terraform"
        Owner = "Student"
        Project = "Demo DevOps-SS-2021"
        Description = "Java, Jenkins"
    }
}