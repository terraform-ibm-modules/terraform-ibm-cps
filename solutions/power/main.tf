######################################################
# COS Service credentials
######################################################

locals {
  cos_service_credentials  = jsondecode(var.ibmcloud_cos_service_credentials)
  cos_apikey               = local.cos_service_credentials.apikey
  cos_resource_instance_id = local.cos_service_credentials.resource_instance_id
}

locals {
  ibmcloud_cos_solution_configuration = {
    cos_apikey               = local.cos_apikey
    cos_region               = var.ibmcloud_cos_configuration.cos_region
    cos_resource_instance_id = local.cos_resource_instance_id
    cos_bucket_name          = var.ibmcloud_cos_configuration.cos_bucket_name
    cos_dir_name             = var.ibmcloud_cos_configuration.cos_solution_software_path
    download_dir_path        = "/tmp"
  }
}
module "ibmcloud_cos_download_cps_binaries" {
  #depends_on = module.powervs_infra

  source  = "terraform-ibm-modules/powervs-sap/ibm//modules/ibmcloud-cos"
  version = "3.0.0"


  access_host_or_ip          = "150.240.163.42"
  target_server_ip           = "10.30.20.5"
  ssh_private_key            = var.ssh_private_key
  ibmcloud_cos_configuration = local.ibmcloud_cos_solution_configuration
}


resource "terraform_data" "setup_cps_host" {

  connection {
    type         = "ssh"
    user         = "root"
    bastion_host = "150.240.163.42"
    host         = "10.30.20.5"
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
    host         = "10.30.20.5"
    private_key  = var.ssh_private_key
    agent        = false
    timeout      = "3m"
  }

# Untar installable
provisioner "remote-exec" {
   inline = ["pwd",
             "mv /tmp/CPSSW/CPSBINARIES.zip /cps-sw-runtime/installable/CPSBINARIES.zip",
             "cd /cps-sw-runtime/installable/CPSBINARIES.zip",
             "unzip CPSBINARIES.zip",
             "cd /cps-sw-runtime/installable/CPSBINARIES.zip/CPSBINARIES",
             "tar -zxvf ipas-software-2.3.5.0-20240912-1539.tgz",
             "sh prereq.sh",
             "sed -i 's/INSTALLATION_UNIQUE_NAME=/INSTALLATION_UNIQUE_NAME=cps2350/g' /cps-sw-runtime/installable/CPSBINARIES.zip/CPSBINARIES/samples/software_response_file",
             "sed -i 's/ADMINISTRATOR_LOGIN=/ADMINISTRATOR_LOGIN=admin/g' /cps-sw-runtime/installable/CPSBINARIES.zip/CPSBINARIES/samples/software_response_file",
             "sed -i 's/ADMINISTRATOR_PASSWORD=/ADMINISTRATOR_PASSWORD=passw0rd/g' /cps-sw-runtime/installable/CPSBINARIES.zip/CPSBINARIES/samples/software_response_file",
             "sed -i 's/INSTALLATION_TYPE=/INSTALLATION_TYPE=software_power/g' /cps-sw-runtime/installable/CPSBINARIES.zip/CPSBINARIES/samples/software_response_file",
             "sed -i 's/FIREWALL_ON_CUSTOM_SETUP_FOUND=/FIREWALL_ON_CUSTOM_SETUP_FOUND=overwrite/g' /cps-sw-runtime/installable/CPSBINARIES.zip/CPSBINARIES/samples/software_response_file",
             "sed -i 's/yum -y install ${IPAS_RPM}/yum -y install --nogpgcheck ${IPAS_RPM}/g' /cps-sw-runtime/installable/CPSBINARIES.zip/CPSBINARIES/install.sh",
             "sh install.sh -s /cps-sw-runtime/installable/CPSBINARIES.zip/CPSBINARIES/samples/software_response_file"]
  }
}