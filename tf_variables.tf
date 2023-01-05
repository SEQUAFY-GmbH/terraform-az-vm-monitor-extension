variable "tags" {
  description = "Bunch of tags to be applied to all resources"
  type        = map(any)
}

variable "resource_group_name" {
  description = "Name of the resource group all resources will be deployed to"
  type        = string
}

variable "storage_account_name" {
  description = "Name of the storage account to be created"
  type        = string
}

variable "vm_name" {
  type        = string
  description = "Name of the virtual machine which will be imported"
}