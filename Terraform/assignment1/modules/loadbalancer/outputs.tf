output "load_balancer_name_out" {
  value       = azurerm_lb.load_balancer.name
  description = "This output variable will output the name of Load Balancer to root module"
}

output "load_balancer_FQDN_out" {
  value       = azurerm_public_ip.lb_frontend_pip.fqdn
  description = "This output variable will output the FQDN of the Load Balancer"
}