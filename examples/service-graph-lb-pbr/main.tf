terraform {
    required_providers {
        aci = {
            source = "ciscodevnet/aci"
        }
    }
}

#Configure provider with your cisco aci credentials.
provider "aci" {
    username = var.aci_username
    password = var.aci_password
    url      = var.aci_url
    insecure = true
}

// Deploy the ACI configuration
module "service-graph-lb-pbr" {
//   source  = "app.terraform.io/cisco-dcn-ecosystem/demo_template/mso"
    source = "../../service-graph-lb-pbr"
//   version = "0.0.4"
    vmm_domain_name = "My-vCenter"
    vmm_controller_name = "dCloud-DC"
    device_mac_address = "01:02:03:04:05:06"
    device_ip_address = "10.10.105.100"
}

output "internal_vlan" {
    value = module.service-graph-lb-pbr.internal_vlan
    description = "The encap for the provider/internal arm"
}

output "external_vlan" {
    value = module.service-graph-lb-pbr.external_vlan
    description = "The encap for the consumer/external arm"
}
