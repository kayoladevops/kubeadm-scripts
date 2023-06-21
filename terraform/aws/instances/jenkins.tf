resource "aws_instance" "jenkins-docker-inst" {
  ami               = "ami-053b0d53c279acc90"
  instance_type     = "t2.medium"
  key_name          = "docker"
  subnet_id         = "subnet-06be1022cf7218354"
  security_groups   = ["sg-0f4e4ea1d8907c730"]
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