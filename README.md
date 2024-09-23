# IBM Cloud Pak System Software on Power VS

[![pre-commit](https://img.shields.io/badge/pre--commit-enabled-brightgreen?logo=pre-commit&logoColor=white)](https://github.com/pre-commit/pre-commit)
[![latest release](https://img.shields.io/github/v/release/terraform-ibm-modules/terraform-ibm-powervs-sap?logo=GitHub&sort=semver)](https://github.com/terraform-ibm-modules/terraform-ibm-cps/releases/latest)
[![Renovate enabled](https://img.shields.io/badge/renovate-enabled-brightgreen.svg)](https://renovatebot.com/)

## Summary
This repository contains deployable architecture solutions that help in deploying Power Virtual Server for IBM Cloud Pak System. The solutions are available in the IBM Cloud Catalog and can also be deployed without the catalog, except for a few solutions.


### IBM catalog solutions that require a Schematics workspace ID of [Power Virtual Server with VPC landing zone](https://cloud.ibm.com/catalog/architecture/deploy-arch-ibm-pvs-inf-2dd486c7-b317-4aaa-907b-42671485ad96-global)
1. [IBM Cloud Pak System Software for POWER variation]([https://github.com/terraform-ibm-modules/terraform-ibm-powervs-sap/tree/main/solutions/ibm-catalog/sap-ready-to-go](https://github.com/terraform-ibm-modules/terraform-ibm-cps/tree/gayathri-1/solutions/CPS_POWER))
    - Deploys **one CPS instance on RHEL 8.10 linux machine.
   



## Reference architectures
- [IBM Cloud Pak System Software for POWER]([https://github.com/terraform-ibm-modules/terraform-ibm-cps/blob/gayathri-1/images/IBM_Cloud_Pak_System_Software_for_POWER/deploy-arch-ibm-CPS-pvs-inf-standard.svg](https://raw.githubusercontent.com/terraform-ibm-modules/terraform-ibm-cps/refs/heads/gayathri-1/reference-architectures/CPS_Software_for_POWER/deploy-arch-ibm-CPS-pvs-inf-standard.svg))


## Solutions
|                                  Variation                                  | Available on IBM Catalog | Requires Schematics Workspace ID | Creates PowerVS with VPC landing zone | Creates PowerVS HANA Instance | Creates PowerVS NW Instances | Performs PowerVS OS Config | Performs PowerVS SAP Tuning | Install SAP software |
|:---------------------------------------------------------------------------:|:------------------------:|:--------------------------------:|:-------------------------------------:|:-----------------------------:|:----------------------------:|:--------------------------:|:---------------------------:|:--------------------:|
| [ IBM Cloud Pak System for Power ]( ./solutions/ibm-catalog/sap-ready-to-go/ ) |    :heavy_check_mark:    |        :heavy_check_mark:        |                  N/A                  |               1               |            0 to N            |     :heavy_check_mark:     |      :heavy_check_mark:     |          N/A         |

## Required IAM access policies

You need the following permissions to run this module.

- Account Management
    - **Resource Group** service
        - `Viewer` platform access
    - IAM Services
        - **Workspace for Power Systems Virtual Server** service
        - **Power Systems Virtual Server** service
            - `Editor` platform access
        - **VPC Infrastructure Services** service
            - `Editor` platform access
        - **Transit Gateway** service
            - `Editor` platform access
        - **Direct Link** service
            - `Editor` platform access

## Contributing

You can report issues and request features for this module in GitHub issues in the module repository. See [Report an issue or request a feature](https://github.com/terraform-ibm-modules/.github/blob/main/.github/SUPPORT.md).

To set up your local development environment, see [Local development setup](https://terraform-ibm-modules.github.io/documentation/#/local-dev-setup) in the project documentation.
<!-- END CONTRIBUTING HOOK -->
