# Multi-Environment Deployment with Terraform and Ansible

This repository demonstrates a multi-environment deployment strategy using **Terraform** and **Ansible**. Terraform handles the provisioning of cloud infrastructure across different environments (e.g., dev, staging, production), while Ansible is used for post-provisioning configuration and software deployment.

---

## Features

- **Multi-Environment Support**: Manage deployments for `dev`, `staging`, and `production` environments.
- **Terraform for Infrastructure Provisioning**: Automates resource creation, such as EC2 instances, S3 buckets, and more.
- **Ansible for Configuration Management**: Configures servers, installs software (e.g., Nginx), and deploys web applications.
- **Scalability and Reusability**: Modular design for scalable infrastructure management.
- **Secure Configuration**: Sensitive data is excluded from the repository using `.gitignore`.

---

## Project Structure

```
.
├── ansible/                     # Ansible playbooks and roles
│   ├── inventories/             # Environment-specific inventory files
│   │   ├── dev                  # Dev environment inventory
│   │   ├── staging              # Staging environment inventory
│   │   └── production           # Production environment inventory
│   ├── playbooks/               # Main Ansible playbooks
│   │   ├── install_nginx.yml    # Playbook to install and configure Nginx
│   │   ├── update_inventories.sh# Script to manage dynamic inventories
│   ├── roles/                   # Ansible roles for modular configuration
│       └── nginx-role/          # Role to configure Nginx
│           ├── tasks/           # Tasks for the Nginx role
│           ├── handlers/        # Handlers for restarting services
│           ├── templates/       # Templates for configuration files
│           ├── files/           # Static files (e.g., index.html)
│           ├── vars/            # Role-specific variables
│           ├── defaults/        # Default variables for the role
├── terraform/                   # Terraform configurations
│   ├── infra/                   # Specific resource configurations
│   ├── main.tf                  # Main Terraform configuration
│   ├── providers.tf             # Provider configurations
│   ├── variables.tf             # Input variables for environments
│   ├── .gitignore               # Excludes sensitive files and unnecessary directories
├── LICENSE                      # License for the project
```

---

## Prerequisites

Before starting, ensure the following tools are installed:

- **Terraform**: [Install Terraform](https://www.terraform.io/downloads.html)
- **Ansible**: [Install Ansible](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html)
- **AWS CLI**: [Install AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2.html)
- **Git**: [Install Git](https://git-scm.com/downloads)

---

## Setup Instructions

### Step 1: Clone the Repository
```bash
git clone https://github.com/kush-shah05/Multi-Environment-Deployment-with-Terraform-and-Ansible.git
cd Multi-Environment-Deployment-with-Terraform-and-Ansible
```

---

### Step 2: Provision Infrastructure with Terraform

1. **Navigate to the Terraform Directory**:
   ```bash
   cd terraform
   ```

2. **Initialize Terraform**:
   ```bash
   terraform init
   ```

3. **Set Environment Variables**:
   Export environment-specific variables, e.g.:
   ```bash
   export TF_VAR_environment="dev"
   ```

4. **Plan the Deployment**:
   ```bash
   terraform plan
   ```

5. **Apply the Configuration**:
   ```bash
   terraform apply
   ```

6. **Note the Outputs**:
   Terraform will output information (e.g., IP addresses) needed for Ansible configuration.

---

### Step 3: Configure Servers with Ansible

1. **Update Ansible Inventory**:
   Update `ansible/inventories/<environment>` with the IP addresses of the provisioned instances.

2. **Run Ansible Playbook**:
   Execute the playbook to configure the instances:
   ```bash
   ansible-playbook -i ansible/inventories/dev ansible/playbooks/install_nginx.yml
   ```

---

## Security Best Practices

- **Private Keys**: Ensure private keys are excluded using `.gitignore`.
- **State Files**: Avoid committing Terraform state files (`terraform.tfstate`) as they may contain sensitive information.
- **Ansible Vault**: Use Ansible Vault to encrypt sensitive variables.

---

## License

This project is licensed under the [MIT License](LICENSE).

---

## Contributing

Contributions are welcome! Please open an issue or submit a pull request for improvements.

---

## Author

**Kush Shah**  
[GitHub Profile](https://github.com/kush-shah05)
