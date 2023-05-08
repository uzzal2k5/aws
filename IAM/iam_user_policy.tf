resource "aws_iam_user_policy" "iam_user_policy" {
  count = length(var.iam_username)
  name = aws_iam_user.iam_user.id
  user = element(var.iam_username,count.index)
  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "ec2:Describe*"
      ],
      "Resource": "*"
    }
  ]
}
EOF
}





