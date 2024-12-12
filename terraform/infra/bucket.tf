resource "aws_s3_bucket" "my_bucket" {
  bucket = "${var.env}kush-terra-bucket"
  tags = {
     name="${var.env}kush-terra-bucket"
     environment=var.env
  }
}
