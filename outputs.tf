# outputs.tf
# This file defines the values that Terraform will return (i.e., "outputs")
# after applying the configuration. These outputs can be viewed on the CLI
# or referenced by other Terraform configurations.


# Resource Group Name
# Exposes the name of the Resource Group for easy reference
output "resource_group_name" {
  description = "The name of the resource group."
  value       = azurerm_resource_group.this.name
}

# Storage Account Name
# Provides the name of the Storage Account
output "storage_account_name" {
  description = "The name of the storage account."
  value       = azurerm_storage_account.this.name
}

# Storage Account Key
# Outputs the primary access key for the Storage Account (sensitive)
output "storage_account_key" {
  description = "The primary access key for the storage account."
  value       = azurerm_storage_account.this.primary_access_key
  sensitive   = true
}

# Container (Filesystem) Name
# Exposes the name of the Data Lake Gen2 container
output "container_name" {
  description = "The container (filesystem) name."
  value       = azurerm_storage_data_lake_gen2_filesystem.this.name
}

# Created Folders
# Shows which folders were created in the Data Lake Gen2 filesystem
output "folders_created" {
  description = "The folders that were created."
  value       = { for k, folder in azurerm_storage_data_lake_gen2_path.folders : k => folder.path }
}

# Resource Location
# Provides the location (region) where resources are deployed
output "location" {
  description = "The location where the resources are deployed."
  value       = azurerm_resource_group.this.location
}
