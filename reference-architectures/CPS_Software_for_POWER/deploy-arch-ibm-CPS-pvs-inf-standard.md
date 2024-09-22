---

copyright:
  years: 2024
lastupdated: "2024-06-10"
keywords:
subcollection: deployable-reference-architectures
authors:
  - name: Madhu Sudhan K N 
  - name: Gayathri Bheemesh
production: true
deployment-url: https://cloud.ibm.com/catalog/architecture/deploy-arch-ibm-pvs-sap-9aa6135e-75d5-467e-9f4a-ac2a21c069b8-global
docs: https://cloud.ibm.com/docs/sap-powervs
image_source: https://github.com/terraform-ibm-modules/terraform-ibm-cps/blob/gayathri-1/reference-architectures/CPS_Software_for_POWER/deploy-arch-ibm-CPS-pvs-inf-standard.svg
use-case: ITServiceManagement
industry: Technology
compliance: SAPCertified
content-type: reference-architecture
version: v1.0.0
related_links:
  - title: 'CPS Software on IBM Cloud documentation'
    url: 'https://cloud.ibm.com/docs/sap'
    description: 'CPS on IBM Cloud documentation.'
  - title: 'Reference architecture for "CPS Software on IBM PowerVS" as full stack deployment'
    url: 'https://cloud.ibm.com/docs/deployable-reference-architectures?topic=deployable-reference-architectures-deploy-arch-ibm-pvs-inf-full-stack'
    description: 'Reference architecture for "Power Virtual Server with VPC landing zone" as full stack deployment'
  - title: 'Reference architecture for "Power Virtual Server with VPC landing zone" as extension of existing deployment'
    url: 'https://cloud.ibm.com/docs/deployable-reference-architectures?topic=deployable-reference-architectures-deploy-arch-ibm-pvs-inf-extension'
    description: 'Reference architecture for "Power Virtual Server with VPC landing zone" as extension of existing deployment'

---

{{site.data.keyword.attribute-definition-list}}

# Power Virtual Server for CPS - variation 'IBM Cloud Pak System Software for POWER'
{: toc-content-type="reference-architecture"}
{: toc-industry="Technology"}
{: toc-use-case="ITServiceManagement"}
{: toc-compliance="SAPCertified"}
{: toc-version="2.1.1"}

CPS Cloud Pak System allows running and management of workloads.....

Services such as DNS, NTP, and NFS running in VPC and provided by Power Virtual Server with VPC landing zone are leveraged.

The transit gateway provide the network bridge between the IBM Power infrastructure and the IBM Cloud® VPC and public internet.

## Architecture diagram
{: #CPS-architecture-diagram}

![Architecture diagram for 'CPS on Power Virtual Server' - variation 'IBM Cloud Pak System Software for POWER'.](deploy-arch-ibm-CPS-pvs-inf-standard.svg "Architecture diagram"){: caption="Figure 1. PowerVS instances prepared to run CPS in PowerVS workspace" caption-side="bottom"}{: external download="deploy-arch-ibm-CPS-pvs-inf-standard.svg"}

## Design requirements
{: #CPS-design-requirements}

![Design requirements for 'Power Virtual Server for CPS' - variation 'IBM Cloud Pak System Software for POWER'](heat-map-deploy-arch-ibm-pvs-sap-ready-to-go.svg "Design requirements"){: caption="Figure 2. Scope of the solution requirements" caption-side="bottom"}

IBM Cloud Power Virtual Servers (PowerVS) is a public cloud offering that allows an enterprise to establish its own private IBM Power computing environment on shared public cloud infrastructure. Due to its scalability and resilience, PowerVS is the premium platform for CPS Power workloads in the cloud world. The reference architecture for 'Power Virtual Server for CPS' - variation 'IBM Cloud Pak System Software for POWER' is designed to provide PowerVS Linux instances prepared and configured for CPS workloads according to the best practices and requirements using IBM Cloud® deployable architectures framework.

## Components

### Key and password management architecture decisions


## Compliance




## Next steps



