import boto3
import psycopg2
import json

def lambda_handler(event, context):
    secret_name = "rds-db-secret"
    region_name = "ap-south-1"

    # Get secret from Secrets Manager
    client = boto3.client("secretsmanager", region_name=region_name)
    secret_response = client.get_secret_value(SecretId=secret_name)
    secret = json.loads(secret_response["SecretString"])

    # Connect to PostgreSQL
    try:
        conn = psycopg2.connect(
            host=secret["host"],
            database=secret["dbname"],
            user=secret["username"],
            password=secret["password"],
            port=secret["port"]
        )
        cur = conn.cursor()
        cur.execute("SELECT version();")
        version = cur.fetchone()
        conn.close()
        return {
            "statusCode": 200,
            "body": f"Connected successfully! PostgreSQL version: {version}"
        }
    except Exception as e:
        return {
            "statusCode": 500,
            "body": f"Connection failed: {str(e)}"
        }
