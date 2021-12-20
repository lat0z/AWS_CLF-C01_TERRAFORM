#define the single ec2 instance 


provider "aws" {
  region = "${var.region}"
}

data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"]
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server*"]
  }

}
#I am trying to set the amazon linux one 
data "aws_ami" "amazon-linux" {
  most_recent = true
  owners      = ["137112412989"]
  filter {
    name   = "name"
    values = ["amzn2-ami-kernel-5.10-hvm-2.0.*-x86_64-gp2"]
  }

}
resource "aws_instance" "helloworld" {
  #ami = data.aws_ami.ubuntu.id
  ami                    = data.aws_ami.amazon-linux.id
  instance_type          = "t2.micro"
  key_name               = aws_key_pair.public-key.key_name
  vpc_security_group_ids = [aws_security_group.custom.id]
  iam_instance_profile   = aws_iam_instance_profile.iam_profile.id
  tags = {
    Name = "HelloWorld"
  }
  user_data = <<EOF
#!/bin/bash
yum update -y 
yum install -y httpd
systemctl start httpd
systemctl enable httpd
echo "<h1> Hello World from $(hostname -I) </h1>" > /var/www/html/index.html
EOF
}

#first steps to enable the ssh communication with the instance 
resource "aws_key_pair" "public-key" {
  key_name   = "deployer-key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCQoEQxGT1ReH5HRw1M8jqdYW1uLFcyQDc/vLCl7ToUgcG0MaKSCAW60F8J5lcyRsiiYx6LAkoTQ5DGn+IclkpEOZJCFwYyh8lVTeCt3vd6jpVMLx0xiIRul79DH/ulIkhja/4hxpFyNk5zYyWbgSelQwgFTcMmIKt4nkkaZaK5Ikt9OL+SIUL99j20j4BZ3/J4C/jtKZFdBKdQTRRbdRdRN+YM17Fwu1b5wyybtNOGWN83HNYh1VYVKJf0DVxMqYruivm6aK/dhshgphz6ayg2hj2BRmwJQHZfGjpj0IrjhVAJzj0aJdN5jMuNtO6JRJhwWwzB6H2CYc0/sajEes5X"
}



