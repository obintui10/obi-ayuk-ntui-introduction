provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "demo_ec2" {
  ami           = "ami-0c55b159cbfafe1f0" # Example Amazon Linux AMI
  instance_type = "t2.micro"

  tags = {
    Name = "Obi-Demo-EC2"
  }
}
