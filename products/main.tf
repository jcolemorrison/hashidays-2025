ephemeral "random_password" "db_password" {
  length           = 16
  override_special = "!#$%&*()-_=+[]{}<>:?"
}

resource "aws_secretsmanager_secret" "db_password" {
  name = "db_password"
}

resource "aws_secretsmanager_secret_version" "db_password" {
  secret_id                = aws_secretsmanager_secret.db_password.id
  secret_string_wo         = ephemeral.random_password.db_password.result
  secret_string_wo_version = 1
}

ephemeral "aws_secretsmanager_secret_version" "db_password" {
  secret_id = aws_secretsmanager_secret_version.db_password.secret_id
}

resource "aws_db_subnet_group" "products" {
  name       = "db-subnet-group"
  subnet_ids = module.vpc.public_subnet_ids

  tags = {
    Name = "db-subnet-group-${var.project_name}"
  }
}

resource "aws_db_instance" "products" {
  instance_class      = "db.t3.micro"
  allocated_storage   = 5
  engine              = "postgres"
  username            = "hashidays"
  skip_final_snapshot = true
  password_wo         = ephemeral.aws_secretsmanager_secret_version.db_password.secret_string
  password_wo_version = aws_secretsmanager_secret_version.db_password.secret_string_wo_version
  db_subnet_group_name = aws_db_subnet_group.products.name
}