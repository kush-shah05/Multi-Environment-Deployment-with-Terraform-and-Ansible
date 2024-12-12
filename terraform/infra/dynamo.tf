resource "aws_dynamodb_table" "mytable" {
  name = "${var.env}-kush-prac-table"
  billing_mode = "PAY_PER_REQUEST"
  hash_key = "userID"
  attribute {
    name = "userID"
    type = "S"
  }
  tags = {
    name="${var.env}-kush-prac-table"
    environment=var.env
  }
}
