# Creating a secret in AWS Secrets Manager
resource "aws_secretsmanager_secret" "db_secret" {
  name = "db-credentials"
}

# Creating a secret version in AWS Secrets Manager
resource "aws_secretsmanager_secret_version" "db_version" {
  secret_id     = aws_secretsmanager_secret.db_secret.id
  secret_string = jsonencode({
    USER                = var.db_user,
    HOST                = var.db_host,
    PASSWORD            = var.db_password,
    MYSQL_ROOT_PASSWORD = var.db_password,
    DB_NAME             = var.db_name
  })
}
