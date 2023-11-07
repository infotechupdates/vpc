
resource "aws_iam_policy" "s3_backend_policy" {
  name   = "${var.environment}-s3_backend_policy"
  policy = <<EOFX
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": "s3:ListBucket",
      "Resource": "arn:aws:s3:::terraform-iontra-vpc"
    },
    {
      "Effect": "Allow",
      "Action": ["s3:GetObject", "s3:PutObject", "s3:DeleteObject"],
      "Resource": "arn:aws:s3:::terraform-iontra-vpc/prod-vpc"
    }
  ]
}
EOFX
}

resource "aws_iam_policy" "DynamoDB_table_policy" {
  name   = "${var.environment}-DynamoDB_table_policy"
  policy = <<EOFX
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "dynamodb:DescribeTable",
        "dynamodb:GetItem",
        "dynamodb:PutItem",
        "dynamodb:DeleteItem"
      ],
      "Resource": "arn:aws:dynamodb:*:*:table/terraform-state-lock-dynamo"
    }
  ]
}
EOFX
}