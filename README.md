# Terraform and Ansible Infrastructure Project

This repository combines **Terraform** and **Ansible** to provision and configure cloud infrastructure. Terraform handles the infrastructure provisioning, while Ansible is used for post-provisioning configuration and software deployment.

---

## Features

- **Terraform for Infrastructure Provisioning**: Automates the creation of AWS infrastructure such as EC2 instances, S3 buckets, and more.
- **Ansible for Configuration Management**: Configures provisioned instances, deploys Nginx, and sets up a web server.
- **Infrastructure as Code (IaC)**: Ensures consistent and reusable configurations.
- **Secure Configuration**: Sensitive data, such as private keys, is excluded from the repository using `.gitignore`.

---

## Project Structure

```
.
├── ansible/                     # Ansible playbooks and roles
│   ├── inventories/             # Ansible inventory files (e.g., dev, staging, production)
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
│   ├── infra/                   # Specific Terraform resource configurations
│   ├── main.tf                  # Main Terraform file
│   ├── providers.tf             # Terraform provider configurations
│   ├── terraform.tfstate        # (Excluded) State file for Terraform
│   ├── .gitignore               # Excludes sensitive files and unnecessary directories
├── LICENSE                      # License for the project
```

---

## Prerequisites

Before starting, ensure the following are installed:

- **Terraform**: [Install Terraform](https://www.terraform.io/downloads.html)
- **Ansible**: [Install Ansible](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html)
- **AWS CLI**: [Install AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2.html)
- **Git**: [Install Git](https://git-scm.com/downloads)

---

## Setup Instructions

### Step 1: Clone the Repository
```bash
git clone https://github.com/kush-shah05/kaib.git
cd kaib
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

3. **Plan the Deployment**:
   ```bash
   terraform plan
   ```

4. **Apply the Configuration**:
   ```bash
   terraform apply
   ```

5. **Note the Outputs**:
   Terraform will output necessary information (e.g., IP addresses) for use in Ansible.

---

### Step 3: Configure Instances with Ansible

1. **Update Ansible Inventory**:
   Update `ansible/inventories/<env>` with the IP addresses of the provisioned instances.

2. **Run Ansible Playbook**:
   Execute the Ansible playbook to configure the instances:
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

---
