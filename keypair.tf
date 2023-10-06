# Generate a secure key using a rsa algorithm
resource "tls_private_key" "ec2_key" {
  algorithm = "RSA"
  rsa_bits  = 2048
}

# creating the keypair in aws
resource "aws_key_pair" "ec2_key" {
  key_name   = "jenkins-key"
  public_key = tls_private_key.ec2_key.public_key_openssh
}

# Save the .pem file locally for remote connection
resource "local_file" "ssh_key" {
  filename = "jenkins.pem"
  content  = tls_private_key.ec2_key.private_key_pem
}