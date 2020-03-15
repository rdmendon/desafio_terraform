provider "aws" {
  region = "sa-east-1"
}

resource "aws_instance" "test-ec2-instance" {
  ami = "ami-05b7dbc290217250d"
  instance_type = "t2.micro"
  key_name = "desafio-aws2"
  security_groups = ["${aws_security_group.ingress-all-test.id}"]
tags {
    Name = "Desafio"
  }
subnet_id = "${aws_subnet.subnet-uno.id}"
associate_public_ip_address = true
user_data = "${file("docker.sh")}"

}
