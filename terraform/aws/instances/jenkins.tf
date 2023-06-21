resource "aws_instance" "jenkins-docker-inst" {
  ami               = "ami-053b0d53c279acc90"
  instance_type     = "t2.medium"
  key_name          = "docker"
  subnet_id         = "subnet-01ad6bfee6d3be7d1"
  security_groups   = ["sg-0da8a8fd8b6fafe62"]
  availability_zone = "us-east-1a"
  


  tags = {
    Name = "jenkins.docker"
  }

}

resource "aws_ec2_instance_state" "running" {
  instance_id = aws_instance.jenkins-docker-inst.id
  state       = "running"
}

output "private-ip" {
  value = aws_instance.jenkins-docker-inst.private_ip
}

output "public-ip" {
  value = aws_instance.jenkins-docker-inst.public_ip
}