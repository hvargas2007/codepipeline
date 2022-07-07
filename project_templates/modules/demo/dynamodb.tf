# Create the DynamoDB Table and Partition key
resource "aws_dynamodb_table" "codepipeline_poc" {
  name         = "codepipeline_poc"
  hash_key     = "LockID"
  billing_mode = "PAY_PER_REQUEST"
  attribute {
    name = "LockID"
    type = "S"
  }
  server_side_encryption {
    enabled = true
  }
  tags = { Name = "dynamodb-codepipeline_poc" }
}