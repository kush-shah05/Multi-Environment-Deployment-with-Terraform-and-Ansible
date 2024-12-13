#!/bin/bash

# Paths
TERRAFORM_DIR="/home/ubuntu/terra-ansible-multi-env/terraform"
INVENTORY_SCRIPT="/home/ubuntu/terra-ansible-multi-env/ansible/update_inventories.sh"
ANSIBLE_PLAYBOOK="/home/ubuntu/terra-ansible-multi-env/ansible/playbooks/install_nginx.yml"
ANSIBLE_INVENTORY="/home/ubuntu/terra-ansible-multi-env/ansible/inventories/dev"

# Run Terraform apply
echo "Applying Terraform configuration..."
cd "$TERRAFORM_DIR" || { echo "Terraform directory not found"; exit 1; }
terraform apply -auto-approve

# Update Ansible inventories
echo "Updating Ansible inventories..."
bash "$INVENTORY_SCRIPT"

# Run Ansible playbook
echo "Running Ansible playbook..."
ansible-playbook -i "$ANSIBLE_INVENTORY" "$ANSIBLE_PLAYBOOK"

echo "Deployment completed successfully!"
