ibmcloud_cos_service_credentials = <<-EOF
{
    "apikey": "ZbMJZC1J_Xw9cfx2pcffVMaTv2zFvGTKUsbZ-fgZAgKZ",
    "cos_hmac_keys": {
        "access_key_id": "13ca6c878d8f434eba77f488f5ce5faa",
        "secret_access_key": "224b71f37a010e13c8f6f47338ef7d4ab3921d2be094af0e"
    },
    "endpoints": "https://control.cloud-object-storage.cloud.ibm.com/v2/endpoints",
    "iam_apikey_description": "Auto-generated for key crn:v1:bluemix:public:cloud-object-storage:global:a/67165156f10340b4a16f9a90b4d63e27:f7887690-0782-4089-a6c3-441ec23e8a12:resource-key:13ca6c87-8d8f-434e-ba77-f488f5ce5faa",
    "iam_apikey_id": "ApiKey-d7ddc855-43cf-460b-a0f1-2c1eb20449b5",
    "iam_apikey_name": "cps-test",
    "iam_role_crn": "crn:v1:bluemix:public:iam::::serviceRole:Manager",
    "iam_serviceid_crn": "crn:v1:bluemix:public:iam-identity::a/67165156f10340b4a16f9a90b4d63e27::serviceid:ServiceId-98ab6fb4-5246-49c5-afbf-a8d4065eed4c",
    "resource_instance_id": "crn:v1:bluemix:public:cloud-object-storage:global:a/67165156f10340b4a16f9a90b4d63e27:f7887690-0782-4089-a6c3-441ec23e8a12::"
}
EOF

ibmcloud_cos_configuration = {
    "cos_region" : "us-south",
    "cos_bucket_name" : "cps-test-1",
    "cos_cps_software_path" : "CPSSW/",

  }