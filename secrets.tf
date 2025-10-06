resource "aws_secretsmanager_secret" "db_secret" {
  name = "rds-db-secret"
}

resource "aws_secretsmanager_secret_version" "db_secret_version" {
  secret_id     = aws_secretsmanager_secret.db_secret.id
  secret_string = jsonencode({
    username = var.db_username
    password = var.db_password
    host     = aws_db_instance.postgres.address
    dbname   = var.db_name
    port     = aws_db_instance.postgres.port
  })
}
