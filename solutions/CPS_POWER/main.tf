locals {
  cos_service_credentials  = jsondecode(var.ibmcloud_cos_service_credentials)
  cos_apikey               = local.cos_service_credentials.apikey
  cos_resource_instance_id = local.cos_service_credentials.resource_instance_id



  ibmcloud_cos_cps_configuration = {
    cos_apikey               = local.cos_apikey
    cos_region               = var.ibmcloud_cos_configuration.cos_region
    cos_resource_instance_id = local.cos_resource_instance_id
    cos_bucket_name          = var.ibmcloud_cos_configuration.cos_bucket_name
    cos_dir_name             = var.ibmcloud_cos_configuration.cos_cps_software_path
    download_dir_path        = "/tmp"
  }
}


module "ibmcloud_cos_download_cps_binaries" {
  #depends_on = module.powervs_infra

  source  = "terraform-ibm-modules/powervs-sap/ibm//modules/ibmcloud-cos"
  version = "3.0.0"


  access_host_or_ip          = "150.240.70.84"
  target_server_ip           = "150.240.70.84"
  ssh_private_key            = var.ssh_private_key
  ibmcloud_cos_configuration = local.ibmcloud_cos_cps_configuration
}


resource "terraform_data" "setup_cps_host" {

  connection {
    type         = "ssh"
    user         = "root"
    bastion_host = "150.240.163.42"
    host         = "10.40.10.4"
    private_key  = var.ssh_private_key
    agent        = false
    timeout      = "5m"
  }

  # Create installable  directory
  provisioner "remote-exec" {
    inline = ["mkdir -p /cps-sw-runtime/installable/",]
  }

}
resource "terraform_data" "download_objects" {
depends_on = [ module.ibmcloud_cos_download_cps_binaries ]
  connection {
    type         = "ssh"
    user         = "root"
    bastion_host = "150.240.163.42"
    host         = "10.40.10.4"
    private_key  = var.ssh_private_key
    agent        = false
    timeout      = "3m"
  }

# Untar installable
  provisioner "remote-exec" {
   inline = ["pwd",
             "mv /tmp/CPSBINARIES/CPSBINARIES.zip /cps-sw-runtime/installable/CPSBINARIES.zip",
             "cd /cps-sw-runtime/installable/",
             "unzip CPSBINARIES.zip",
              "cd /cps-sw-runtime/installable/CPSBINARIES",
             "tar -zxvf ipas-software-2.3.5.0-20240912-1539.tgz",]
  }
}