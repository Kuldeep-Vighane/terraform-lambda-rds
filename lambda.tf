data "archive_file" "lambda_zip" {
  type        = "zip"
  source_dir  = "${path.module}/lambda_app"
  output_path = "${path.module}/lambda_app.zip"
}

resource "aws_lambda_function" "db_lambda" {
  function_name = var.lambda_function_name
  role          = aws_iam_role.lambda_role.arn
  handler       = "app.lambda_handler"
  runtime       = "python3.9"
  filename      = data.archive_file.lambda_zip.output_path
  timeout       = 30
  environment {
    variables = {
      SECRET_NAME = aws_secretsmanager_secret.db_secret.name
      REGION_NAME = var.region
    }
  }
}
