resource "aws_instance" "shahrukh" {
  ami                     = "ami-0914547665e6a707c"
  instance_type           = "t3.micro"
  key_name                = "shahrukh786"

provisioner "remote-exec" {
    inline = [
      "sudo apt-get update -y",
      "sudo apt-get install -y --no-install-recommends wget",
      "wget -O /etc/apt/sources.list.d/jenkins.list https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key",
      "curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key | sudo tee /usr/share/keyrings/jenkins-keyring.asc",
      "echo \"deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian-stable binary/\" | sudo tee /etc/apt/sources.list.d/jenkins.list",
      "sudo apt-get update -y",
      "sudo apt-get install -y --no-install-recommends fontconfig openjdk-17-jre",  # Update Java version as needed
      "sudo apt-get install -y --no-install-recommends jenkins",
      "sudo systemctl daemon-reload",
      "sudo systemctl enable jenkins",
      "sudo systemctl start jenkins",
      "sudo apt install git -y",
      "wget https://releases.hashicorp.com/terraform/1.5.4/terraform_1.5.4_linux_amd64.zip",
      "sudo apt install unzip",
      "unzip terraform_1.5.4_linux_amd64.zip",
      "sudo mv terraform /usr/local/bin/",
   ]
}

connection {
type = "ssh"
host = self.public_ip
user = "ubuntu"
private_key = file("./shahrukh.pem")
 }

tags = {
  "name"= "jenkins"
  }
}
