output "iam_user_arn" {
  value = aws_iam_user.iam_user.*.arn
}

output "secret" {
  value = aws_iam_access_key.iam_user_access_key.encrypted_secret
  sensitive = true
}