provider "aws" {
  region = "us-east-2"
}

resource "aws_instance" "builder" {
  ami = "ami-0a91cd140a1fc148a"
  instance_type = "t2.micro"
  key_name      = "bf_app"
  vpc_security_group_ids = [aws_security_group.custom_group1.id]
  
  tags = {
    Name = "builder"
}

}

resource "aws_instance" "production" {
  ami = "ami-0a91cd140a1fc148a"
  instance_type = "t2.micro"
  key_name      = "bf_app"
  vpc_security_group_ids = [aws_security_group.custom_group1.id]

  tags = {
    Name = "production"
}

}

resource "aws_security_group" "custom_group1" {
  name = "custom_group"

    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        from_port = 8080
        to_port = 8080
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
}
