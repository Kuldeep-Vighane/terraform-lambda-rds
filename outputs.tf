output "rds_endpoint" {
  value = aws_db_instance.postgres.address
}

output "lambda_function_name" {
  value = aws_lambda_function.db_lambda.function_name
}
