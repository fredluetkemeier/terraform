resource "aws_instance" "example" {
  ami           = "ami-02e67f70dd7967c1f"
  instance_type = "t2.micro"
}
