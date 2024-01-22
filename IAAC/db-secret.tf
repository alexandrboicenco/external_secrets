# Creating a secret in AWS Secrets Manager
resource "aws_secretsmanager_secret" "db_secret" {
  name = "db-credentials"
}

# Creating a secret version in AWS Secrets Manager
resource "aws_secretsmanager_secret_version" "db_version" {
  secret_id     = aws_secretsmanager_secret.db_secret.id
  secret_string = jsonencode({
    USER     = null,
    HOST     = null,
    PASSWORD = null,
  })
}

# Creating a secret in AWS Secrets Manager
resource "aws_secretsmanager_secret" "test_secret" {
  name = "test-credentials"
}

# Creating a secret version in AWS Secrets Manager
resource "aws_secretsmanager_secret_version" "test_version" {
  secret_id     = aws_secretsmanager_secret.test_secret.id
  secret_string = jsonencode({
    USER     = null,
    HOST     = null,
    PASSWORD = null,
  })
}
