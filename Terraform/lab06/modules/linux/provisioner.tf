resource "null_resource" "linux_provisioner" {
  count      = var.nb_count
  depends_on = [azurerm_linux_virtual_machine.linux_vm]

  provisioner "remote-exec" {
    inline = [
      "hostname"
    ]
    connection {
      type     = "ssh"
      user     = var.admin_uname
      password = var.admin_paswd
      host     = element(azurerm_linux_virtual_machine.linux_vm[*].public_ip_address, count.index + 1)
    }
  }
}