provider "ibm" {

  ibmcloud_api_key = var.ibmcloud_api_key != null ? var.ibmcloud_api_key : null
}
