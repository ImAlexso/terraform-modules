resource "azurerm_linux_web_app" "this" {
  name                      = var.name
  location                  = var.location
  resource_group_name       = var.resource_group_name
  service_plan_id           = var.service_plan_id
  https_only                = var.https_only
  virtual_network_subnet_id = var.virtual_network_subnet_id
  client_affinity_enabled   = var.client_affinity_enabled
  enabled                   = var.enabled
  tags                      = var.tags

  dynamic "identity" {
    for_each = var.identity == null ? [] : [var.identity]
    content {
      type         = identity.value.type
      identity_ids = try(identity.value.identity_ids, null)
    }
  }

  site_config {
    always_on                               = var.site_config.always_on
    ftps_state                              = var.site_config.ftps_state
    health_check_path                       = var.site_config.health_check_path
    health_check_eviction_time_in_min       = var.site_config.health_check_eviction_time_in_min
    http2_enabled                           = var.site_config.http2_enabled
    minimum_tls_version                     = var.site_config.minimum_tls_version
    vnet_route_all_enabled                  = var.site_config.vnet_route_all_enabled
    container_registry_use_managed_identity = var.site_config.container_registry_use_managed_identity

    dynamic "application_stack" {
      for_each = var.site_config.application_stack == null ? [] : [var.site_config.application_stack]
      content {
        docker_image_name        = try(application_stack.value.docker_image_name, null)
        docker_registry_url      = try(application_stack.value.docker_registry_url, null)
        docker_registry_username = try(application_stack.value.docker_registry_username, null)
        docker_registry_password = try(application_stack.value.docker_registry_password, null)
        java_server              = try(application_stack.value.java_server, null)
        java_server_version      = try(application_stack.value.java_server_version, null)
        java_version             = try(application_stack.value.java_version, null)
        node_version             = try(application_stack.value.node_version, null)
        python_version           = try(application_stack.value.python_version, null)
      }
    }
  }

  app_settings = var.app_settings
}
