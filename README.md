End-to-End Secret Retrieval Test (AWS Lambda)
Project Overview

This project demonstrates how an AWS Lambda function securely retrieves database credentials from AWS Secrets Manager at runtime and connects to a PostgreSQL RDS instance. It validates role-based access and ensures no credentials are hardcoded.

Key Objectives

Securely fetch database credentials from Secrets Manager.

Connect to RDS PostgreSQL using runtime secrets.

Validate IAM role permissions for secret access.

Ensure no sensitive information is stored in code.

Architecture
flowchart LR
    A[AWS Lambda Function] --> B[IAM Role]
    B --> C[AWS Secrets Manager]
    C --> D[RDS PostgreSQL]


Lambda IAM Role grants permissions to read secrets.

Secrets Manager stores the DB username and password.

Lambda fetches secrets at runtime to connect securely to RDS.

Tech Stack

Compute: AWS Lambda

Database: PostgreSQL (AWS RDS)

AWS Services: Secrets Manager, IAM Roles, CloudWatch (for logging)

Language: Python or Node.js

Setup & Usage

Create RDS PostgreSQL instance and note the endpoint.

Store credentials in AWS Secrets Manager.

Create IAM Role for Lambda with secretsmanager:GetSecretValue permission.

Deploy Lambda function with the IAM role attached.

Invoke Lambda → it fetches secrets and connects to RDS.

Verify logs in CloudWatch to confirm success or failure.

Benefits

Demonstrates secure secret management with Lambda.

Validates role-based access control.

Follows AWS best practices by avoiding hardcoded credentials.

License

MIT License – Free to use and adapt.
