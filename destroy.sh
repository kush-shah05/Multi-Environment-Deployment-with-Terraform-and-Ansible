#!/bin/bash

# Paths
TERRAFORM_DIR="/home/ubuntu/terra-ansible-multi-env/terraform"
ANSIBLE_INVENTORY_DIR="/home/ubuntu/terra-ansible-multi-env/ansible/inventories"

# Run Terraform destroy
echo "Destroying Terraform-managed infrastructure..."
cd "$TERRAFORM_DIR" || { echo "Terraform directory not found"; exit 1; }
terraform destroy -auto-approve

# Clear Ansible inventories
echo "Clearing Ansible inventory files..."
> "$ANSIBLE_INVENTORY_DIR/dev"
> "$ANSIBLE_INVENTORY_DIR/stg"
> "$ANSIBLE_INVENTORY_DIR/prd"

echo "Terraform destroy completed and Ansible inventories cleared!"
