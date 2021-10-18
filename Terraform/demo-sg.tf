resource "aws_security_group" "demo_sec_group" {
    name        = "Sec-group demo"
    description = "Security group for webserver and jenkins"    
    
    ingress {
        description      = "Allow all traffic to ssh port"
        from_port        = 22
        to_port          = 22
        protocol         = "tcp"
        cidr_blocks      = ["0.0.0.0/0"]
    } 

    ingress {
        description      = "Allow all traffic to http port"
        from_port        = 80
        to_port          = 80
        protocol         = "tcp"
        cidr_blocks      = ["0.0.0.0/0"]
    }

    ingress {
        description      = "Allow all traffic to docker port"
        from_port        = 4444
        to_port          = 4444
        protocol         = "tcp"
        cidr_blocks      = ["0.0.0.0/0"]
    }

    ingress {
        description      = "Allow all traffic to jenkins port"
        from_port        = 8080
        to_port          = 8080
        protocol         = "tcp"
        cidr_blocks      = ["0.0.0.0/0"]
    }

    egress {
        from_port        = 0
        to_port          = 0
        protocol         = "-1"
        cidr_blocks      = ["0.0.0.0/0"]
    }

    tags = {
      Name = "demo-allow_22-80-4444-8080"
    }
}   