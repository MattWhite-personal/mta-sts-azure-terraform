# MTA-STS/TLS-RPT Azure code

This repo is inspired by the UK NCSC [terraform-aws-mtasts](https://github.com/ukncsc/terraform-aws-mtasts) module to deploy [MTS-STS](https://tools.ietf.org/html/rfc8461) and [TLS-RPT](https://tools.ietf.org/html/rfc8460) policy for a domin in Microsoft Azure using [Terraform](https://www.terraform.io/).

It leverages the following Azure capabilities:
* Resource Group
* DNS Zone to host MTA-STS and TLS-RPT records as well as 
* Storage Account (with static website)
* CDN endpoint for custom domain

## Limitations of current code

As discussed on the [azurerm_cdn_endpoint_custom_domain](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/cdn_endpoint_custom_domain) docs pages it is not possible to enable HTTPs using Terraform and this just needs to be enabled once after initial deployment.

## How to use this code


This consists of using CloudFront/S3 with a Custom Domain to host the MTA-STS policy, with a TLS certificate provided by AWS ACM. It uses Route53 to configure the DNS portions of both MTA-STS and TLS-RPT.

## How to use this Module

This module assumes AWS Account with access to Route53, CloudFront, S3, and ACM, which also hosts the DNS (in Route53) for the domain you wish to deploy MTA-STS/TLS-RPT.

```terraform
module "mtastspolicy_tftest" {
  source          = "github.com/MattWhite-personal/terraform-azure-mtasts/terraform"
  resource_group  = "resource-group-name"
  DOMAIN          = "domainname.co.uk"
  MTASTSMODE      = "testing"
  MX              = ["mx1.domain.com","mx2.domain.com"]
  REPORTING_EMAIL = "tls-rpt"
}

```
