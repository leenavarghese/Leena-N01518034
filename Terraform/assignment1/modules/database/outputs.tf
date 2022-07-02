output "postgres_db_name_out" {
  value       = azurerm_postgresql_database.postgres_database.name
  description = "This output variable will output the name of PostgreSQL Database to root module"
}