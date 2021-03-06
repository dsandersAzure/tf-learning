# -------------------------------------------------------------------
#
# Module:         ScaleWeb
# Submodule:      modules
# Code set:       main.tf
# Purpose:        Create an Azure backend address pool, typically
#                 for use in a load balancer.
# Created on:     11 February 2018
# Created by:     David Sanders
# Creator email:  dsanderscanada@gmail.com 
# Repository:     https://github.com/dsandersAzure/tf-learning
#
# -------------------------------------------------------------------

# Create a backend address pool for resources being load balanced
# (e.g. VMs, etc.)
#
resource "azurerm_lb_backend_address_pool" "bpepool" {
  resource_group_name = "${var.resource_group_name}"
  loadbalancer_id     = "${var.loadbalancer_id}"
  name                = "${var.resource_prefix}BackEndAddressPool"
}

output "be_pool_id" {
    value = "${azurerm_lb_backend_address_pool.bpepool.id}"
}