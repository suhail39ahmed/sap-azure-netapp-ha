output "hana_data_mount" {
  value = azurerm_netapp_volume.hana_data.mount_ip_addresses[0]
}

output "hana_log_mount" {
  value = azurerm_netapp_volume.hana_log.mount_ip_addresses[0]
}
