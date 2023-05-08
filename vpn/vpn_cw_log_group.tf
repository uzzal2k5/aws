resource "aws_cloudwatch_log_group" "vpn_log_group" {
  name              = "/aws/vpn/${var.vpn_endpoint_name}/logs"
  retention_in_days = var.logs_retention

  tags = merge(
    var.tags,
    tomap({
      "Name"    = "${var.vpn_endpoint_name}-Client-VPN-Log-Group",
      "EnvName" = var.vpn_endpoint_name
    })
  )
}

resource "aws_cloudwatch_log_stream" "vpn_log_stream" {
  name           = "vpn_log_stream"
  log_group_name = aws_cloudwatch_log_group.vpn_log_group.name
}