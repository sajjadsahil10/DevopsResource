provider "aws" {
    region = ""us-east-1"
}

resource  "aws_instance" "intro" {
  ami                    = "ami-0ebfd941bbafe70c6"
  instance_type          = "t2.micro"
  availability_zone      = "us-east-1a"
  key_name               = "kops_key"
  vpc_security_group_ids = ["sg-03aef3531595fdb53"]
  tags = {
    Name    = "Dove-Instance"
    Project = "Dove"
  }
}
