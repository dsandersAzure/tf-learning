# -------------------------------------------------------------------
#
# Module:         ScaleWeb
# Code set:       vmss.tf
# Purpose:        Create a scaled webserver farm with a bastion
#                 server to enable connection to resources via ssh.
# Created on:     11 February 2018
# Created by:     David Sanders
# Creator email:  dsanderscanada@gmail.com 
# Repository:     https://github.com/dsandersAzure/tf-learning
#
# -------------------------------------------------------------------

# Create a public IP for the load balancer and assign a static
# address.
#
variable "pip_name" {}
variable "location" {}
variable "resource_group_name" {}
variable "environment" {}
variable "name" {}
variable "resource_prefix" {}
variable "domain_name" {}

resource "azurerm_public_ip" "pip" {
  name                         = "${var.resource_prefix}-${var.pip_name}-pip"
  location                     = "${var.location}"
  resource_group_name          = "${var.resource_group_name}"
  public_ip_address_allocation = "static"
  domain_name_label            = "${var.domain_name}"

  tags {
    environment = "${var.environment}"
    name = "${var.name}"
  }
}

output "ip_id" {
  value = "${azurerm_public_ip.pip.id}"
}

output "ip_fqdn" {
  value = "${azurerm_public_ip.pip.fqdn}"
}
