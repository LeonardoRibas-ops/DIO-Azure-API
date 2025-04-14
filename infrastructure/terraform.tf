provider "azurerm" {
  features {}
}

variable "app_name" {
  default = "apiPagamento"
}

variable "location" {
  default = "East US"
}

resource "azurerm_resource_group" "rg" {
  name     = "${var.app_name}-rg"
  location = var.location
}

resource "azurerm_storage_account" "storage" {
  name                     = lower("${var.app_name}stg")
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_service_plan" "plan" {
  name                = "${var.app_name}-plan"
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
  os_type             = "Linux"
  sku_name            = "Y1"
}

resource "azurerm_linux_function_app" "function" {
  name                       = "${var.app_name}-func"
  resource_group_name        = azurerm_resource_group.rg.name
  location                   = var.location
  service_plan_id            = azurerm_service_plan.plan.id
  storage_account_name       = azurerm_storage_account.storage.name
  storage_account_access_key = azurerm_storage_account.storage.primary_access_key
  site_config {
    application_stack {
      python_version = "3.10"
    }
  }
}

resource "azurerm_api_management" "apim" {
  name                = "${var.app_name}-apim"
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
  publisher_name      = "Admin"
  publisher_email     = "admin@seudominio.com"
  sku_name            = "Consumption_0"
}

resource "azurerm_key_vault" "kv" {
  name                = "${var.app_name}-kv"
  location            = var.location
  resource_group_name = azurerm_resource_group.rg.name
  tenant_id           = data.azurerm_client_config.current.tenant_id
  sku_name            = "standard"
}

