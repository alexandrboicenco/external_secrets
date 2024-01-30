# Create an IAM user for External Secrets
resource "aws_iam_user" "external_secrets" {
  name = "external-secrets"
}

# Create an IAM access key for the user
resource "aws_iam_access_key" "external_secrets" {
  user = aws_iam_user.external_secrets.name
}

# Create an IAM policy for Secret Manager access
resource "aws_iam_policy" "secret_manager_policy" {
  name        = "SecretManagerAccessPolicy"
  description = "Policy for accessing AWS Secrets Manager"

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect   = "Allow",
        Action   = "secretsmanager:GetSecretValue",
        Resource = "*",
      },
    ],
  })
}

# Attach the policy to the IAM user
resource "aws_iam_user_policy_attachment" "secret_manager_access_attachment" {
  user       = aws_iam_user.external_secrets.name
  policy_arn = aws_iam_policy.secret_manager_policy.arn
}

# Create a Kubernetes Secret
resource "kubernetes_secret" "external_secrets_credentials" {
  metadata {
    name = "external-secrets-credentials"
    namespace  = kubernetes_namespace_v1.this.metadata[0].name
  }

  data = {
    AWS_ACCESS_KEY_ID     = aws_iam_access_key.external_secrets.id
    AWS_SECRET_ACCESS_KEY = aws_iam_access_key.external_secrets.secret
  }
}
