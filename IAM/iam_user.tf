resource "aws_iam_user" "iam_user" {
  count = length(var.iam_username)
  name = element(var.iam_username,count.index )
}