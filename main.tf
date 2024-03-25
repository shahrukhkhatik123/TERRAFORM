resource "aws_instance" "shahrukh" {
  ami                     = "ami-0914547665e6a707c"
  instance_type           = "t3.micro"
  tags = {
  "name"= "jenkins"
  }
}
