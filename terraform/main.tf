# SAP HANA on Azure NetApp Files - primary + replica capacity pools and volumes
terraform {
  required_providers {
    azurerm = { source = "hashicorp/azurerm", version = "~> 3.0" }
    azapi   = { source = "Azure/azapi", version = "~> 1.0" }
  }
}

resource "azurerm_resource_group" "anf" {
  name     = var.resource_group_name
  location = var.location
  tags     = var.tags
}

resource "azurerm_netapp_account" "anf" {
  name                = "${var.prefix}-anf-account"
  resource_group_name = azurerm_resource_group.anf.name
  location            = azurerm_resource_group.anf.location
  tags                = var.tags
}

resource "azurerm_netapp_pool" "primary" {
  name                = "${var.prefix}-pool-primary"
  account_name        = azurerm_netapp_account.anf.name
  location            = azurerm_resource_group.anf.location
  resource_group_name = azurerm_resource_group.anf.name
  service_level       = var.service_level
  size_in_tb          = var.pool_size_tb
  tags                = var.tags
}

resource "azurerm_netapp_volume" "hana_data" {
  name                 = "${var.prefix}-hana-data"
  volume_path          = "hana-data"
  resource_group_name  = azurerm_resource_group.anf.name
  location             = azurerm_resource_group.anf.location
  account_name         = azurerm_netapp_account.anf.name
  pool_name            = azurerm_netapp_pool.primary.name
  service_level        = var.service_level
  subnet_id            = var.anf_subnet_id
  storage_quota_in_gb   = var.hana_data_quota_gb
  protocols            = ["NFSv4.1"]
  tags                 = var.tags
}

resource "azurerm_netapp_volume" "hana_log" {
  name                 = "${var.prefix}-hana-log"
  volume_path          = "hana-log"
  resource_group_name  = azurerm_resource_group.anf.name
  location             = azurerm_resource_group.anf.location
  account_name         = azurerm_netapp_account.anf.name
  pool_name            = azurerm_netapp_pool.primary.name
  service_level        = var.service_level
  subnet_id            = var.anf_subnet_id
  storage_quota_in_gb   = var.hana_log_quota_gb
  protocols             = ["NFSv4.1"]
  tags                  = var.tags
}

# Cross-zone replication: create replica volume in secondary region (see data_replication block in docs)
# Placeholder: second pool/volume in DR region would go here
