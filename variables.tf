##############################################################################################################
#
# DRGv2 Hub and Spoke traffic inspection
# FortiGate Active/Active Load Balanced pair of standalone FortiGate VMs for resilience and scale
# Terraform deployment template for Oracle Cloud
#
##############################################################################################################

# Prefix for all resources created for this deployment in Microsoft Azure
variable "PREFIX" {
  description = "Added name to each deployed resource"
}

variable "region" {
  description = "Oracle Cloud region"
}

##############################################################################################################
# Oracle Cloud configuration
##############################################################################################################

variable "tenancy_ocid" {}
variable "compartment_ocid" {}
variable "user_ocid" {
  default = ""
}
variable "private_key_path" {
  default = ""
}
variable "fingerprint" {
  default = ""
}

##############################################################################################################
# FortiGate instance type
##############################################################################################################
variable "instance_shape" {
  type    = string
  default = "VM.Standard.E3.Flex"
}

variable "mp_listing_id" {
  default = "ocid1.appcataloglisting.oc1..aaaaaaaam7ewzrjbltqiarxukuk72v2lqkdtpqtwxqpszqqvrm7likfnpt5q" //byol
}

variable "mp_listing_resource_id" {
  default = "ocid1.image.oc1..aaaaaaaagm4k5jqbikfx6f5afc4voff2b5sag7d7ibg3oqpnb4xl332tpxca"
}

// Version
variable "mp_listing_resource_version" {
  default = "7.0.5_SR-IOV_Para-Virtualized_Mode"
}
// Cert use for SDN Connector setting
variable "cert" {
  type    = string
  default = "Fortinet_Factory"
}

##############################################################################################################
# FortiGate license type
##############################################################################################################

// license file location for fgt a
variable "fgt_byol_license_a" {
  // Change to your own path
  type    = string
  default = ""
}

// license file location for fgt b
variable "fgt_byol_license_b" {
  // Change to your own path
  type    = string
  default = ""
}

// Flex-VM license token for fgt a
variable "fgt_byol_flexvm_license_a" {
  // Change to your own path
  type    = string
  default = ""
}

// Flex-VM license token for fgt b
variable "fgt_byol_flexvm_license_b" {
  // Change to your own path
  type    = string
  default = ""
}

##############################################################################################################
# VCN and SUBNET ADDRESSESS
##############################################################################################################

variable "vcn" {
  default = "10.20.0.0/22"
}

variable "subnet" {
  type        = map(string)
  description = ""

  default = {
    "1" = "10.20.0.0/27"  # Flexible Network Load Balancer
    "2" = "10.20.0.32/27" # Untrusted
    "3" = "10.20.0.64/27" # Trusted
  }
}

variable "subnetmask" {
  type        = map(string)
  description = ""

  default = {
    "1" = "28" # Flexible Network Load Balancer
    "2" = "28" # Untrusted
    "3" = "28" # Trusted
  }
}

variable "gateway" {
  type        = map(string)
  description = ""

  default = {
    "1" = "10.20.0.1"  # Flexible Network Load Balancer
    "2" = "10.20.0.33" # Untrusted
    "3" = "10.20.0.65" # Trusted
  }
}

variable "fgt_ipaddress_a" {
  type        = map(string)
  description = ""

  default = {
    "2" = "10.20.0.35" # Untrusted
    "3" = "10.20.0.67" # Trusted
  }
}

variable "fgt_ipaddress_b" {
  type        = map(string)
  description = ""

  default = {
    "2" = "10.20.0.36" # Untrusted
    "3" = "10.20.0.68" # Trusted
  }
}

variable "trusted_nlb_ipaddress" {
  type        = map(string)
  description = ""

  default = {
    "1" = "10.20.0.69" # Trusted
  }
}

variable "vcn_cidr_spoke1" {
  type    = string
  default = "172.16.144.0/24"
}

variable "vcn_cidr_spoke2" {
  type    = string
  default = "172.16.145.0/24"
}

# Choose an Availability Domain (1,2,3)
variable "availability_domain" {
  type    = string
  default = "1"
}

variable "availability_domain2" {
  type    = string
  default = "2"
}

variable "volume_size" {
  type    = string
  default = "50" //GB; you can modify this, can't less than 50
}
