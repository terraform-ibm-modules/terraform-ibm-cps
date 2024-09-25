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
  description = "Cloud Object Storage instance containing CPS installation files that will be downloaded to NFS share. 'cos_solution_software_path' must contain only binaries required for CPS installation and must not contain any IMDB files. If you have an optional stack xml file (maintenance planner), place it under the 'cos_solution_software_path' directory. Avoid inserting '/' at the beginning for 'cos_solution_software_path' and 'cos_solution_software_path'."
  type = object({
    cos_region      = string
    cos_bucket_name = string
    cos_solution_software_path = string
  })
  default = {
    "cos_region" : "us-south",
    "cos_bucket_name" : "cps-test-1",
    "cos_solution_software_path" : "CPSSW/ipas-software-2.3.5.0-20240912-1539.tgz",

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
