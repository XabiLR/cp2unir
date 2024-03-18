output "ip_copiar_inventory" {
  value = azurerm_linux_virtual_machine.myVM1.public_ip_address
}
