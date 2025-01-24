# Spoke Networks

This repository contains the Terraform code for managing spoke virtual networks (VNets) that connect to a central network hub in Azure. The hub-and-spoke topology is used to isolate workloads while sharing common services (e.g., firewalls, DNS) located in the hub.

## Repository Structure

```
spoke-networks/
├── modules/                  # Reusable Terraform modules for network components
│   ├── vnet/               # Module to create a VNet
│   └── subnet/             # Module to create a subnet
└── environments/             # Environment-specific configurations (devtest, staging-UAT, prod)
    └── <environment>/        # e.g., dev, test, prod
        └── <project or solution>/ # e.g., vmworkstations, myapp
          ├── main.tf       # Terraform code to create spoke network resources
          ├── variables.tf  # Variables specific to the project/solution and environment
          └── outputs.tf    # Outputs from the project/solution deployment
```

### Modules

The `modules/` directory contains reusable Terraform modules that define common network components. These modules are designed to be flexible and configurable, allowing you to create consistent and standardized network resources across different projects and environments.

*   **`vnet/`:** This module creates an Azure Virtual Network (VNet) with customizable parameters such as address space, location, and resource group. It also handles peering the spoke VNet to the core network hub.
*   **`subnet/`:** This module creates a subnet within a given VNet. You can specify the subnet name, address prefix, and associate it with the appropriate VNet.

### Environments

The `environments/` directory is organized by environment (e.g., `dev`, `test`, `prod`). Within each environment, you'll find subdirectories for each project, solution, or logical grouping of network resources that requires a separate spoke VNet.

**Example:**

*   `environments/dev/vmworkstations/` contains the Terraform code to create a spoke VNet for user workstations in the development environment.
*   `environments/prod/myapp/` contains the Terraform code to create a spoke VNet for a specific application named "myapp" in the production environment.

**Inside each project directory:**

*   **`main.tf`:** This is the main Terraform configuration file. It uses the modules from the `modules/` directory to create the necessary VNet and subnet(s) for the project.
*   **`variables.tf`:** This file defines variables that are specific to the project and environment, such as address spaces, subnet sizes, or any other custom settings.
*   **`outputs.tf`:** This file defines outputs from the Terraform deployment, such as the VNet ID or subnet IDs, which might be used by other Terraform configurations.

## Usage

1.  **Define Modules:** Create or modify reusable modules in the `modules/` directory as needed for your network components.
2.  **Create Environment-Specific Configurations:** Inside the `environments/` directory, create a subdirectory for each environment.
3.  **Define Project Spoke Networks:** Within each environment, create subdirectories for each project or solution that needs a spoke VNet.
4.  **Configure `main.tf`:** In each project's `main.tf` file, use the modules from the `modules/` directory to provision the required network resources. Use `variables.tf` to customize the configuration for each project and environment.
5.  **Apply Terraform:** Use `terraform init`, `terraform plan`, and `terraform apply` to deploy the infrastructure.
