resource "null_resource" "linux_provisioner" {
  count      = var.vm_count
  depends_on = [
    azurerm_linux_virtual_machine.linux_vm
  ]
  provisioner "remote-exec" {
    inline = [
      "hostname"
    ]
    connection {
      type = "ssh"
      user = var.linux_admin_uname
      password = var.linux_admin_paswd
      host = element(azurerm_linux_virtual_machine.linux_vm[*].public_ip_address, count.index + 1)
    }
  }
}