################################################################
#
# Required Parameters
#
################################################################

variable "prerequisite_workspace_id" {
  description = "IBM Cloud Schematics workspace ID of an existing 'Power Virtual Server with VPC landing zone' catalog solution. If you do not yet have an existing deployment, click [here](https://cloud.ibm.com/catalog/architecture/deploy-arch-ibm-pvs-inf-2dd486c7-b317-4aaa-907b-42671485ad96-global?) to create one."
  type        = string
}

variable "ibmcloud_cos_service_credentials" {
  description = "IBM Cloud Object Storage instance service credentials to access the bucket in the instance.[json example of service credential](https://cloud.ibm.com/docs/cloud-object-storage?topic=cloud-object-storage-service-credentials)"
  type        = string
  sensitive   = true
}

variable "ibmcloud_cos_configuration" {
  description = "Cloud Object Storage instance containing SAP installation files that will be downloaded to NFS share. 'cos_hana_software_path' must contain only binaries required for HANA DB installation. 'cos_solution_software_path' must contain only binaries required for S/4HANA or BW/4HANA installation and must not contain any IMDB files. The binaries required for installation can be found [here](https://github.com/terraform-ibm-modules/terraform-ibm-powervs-sap/blob/main/solutions/ibm-catalog/sap-s4hana-bw4hana/docs/s4hana23_bw4hana21_binaries.md) If you have an optional stack xml file (maintenance planner), place it under the 'cos_solution_software_path' directory. Avoid inserting '/' at the beginning for 'cos_hana_software_path' and 'cos_solution_software_path'."
  type = object({
    cos_region                  = string
    cos_bucket_name             = string
    cos_hana_software_path      = string
    cos_solution_software_path  = string
    cos_swpm_mp_stack_file_name = string
  })
  default = {
    "cos_region" : "eu-geo",
    "cos_bucket_name" : "powervs-automation",
    "cos_hana_software_path" : "HANA_DB/rev78",
    "cos_solution_software_path" : "S4HANA_2023",
    "cos_swpm_mp_stack_file_name" : ""
  }
}

variable "software_download_directory" {
  description = "Software installation binaries will be downloaded to this directory."
  type        = string
  default     = "/software"
}

variable "ssh_private_key" {
  description = "Private SSH key (RSA format) used to login to IBM PowerVS instances. Should match to uploaded public SSH key referenced by 'ssh_public_key' which was created previously. The key is temporarily stored and deleted. For more information about SSH keys, see [SSH keys](https://cloud.ibm.com/docs/vpc?topic=vpc-ssh-keys)."
  type        = string
  sensitive   = true
}

variable "ibmcloud_api_key" {
  description = "IBM Cloud platform API key needed to deploy IAM enabled resources."
  type        = string
  sensitive   = true
}


################################################################
#
# Optional Parameters
#
################################################################

