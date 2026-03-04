# Terraform Demo

## 📌 Overview
This demo project shows how to provision a simple **EC2 instance on AWS** using Terraform.  
It is meant to demonstrate my **Infrastructure as Code (IaC)** skills, not a production setup.

---

## ⚙️ What It Does
- Uses the AWS provider (`us-east-1` region).
- Creates a small EC2 instance (`t2.micro`) with a tag `Obi-Demo-EC2`.
- Demonstrates how Terraform can automate cloud resource provisioning.

---

## 🛠️ Files
- **main.tf** → Terraform configuration file that defines the EC2 instance.
- *(Optional)* `variables.tf` → Can be added to parameterize values like region, instance type, or AMI.

---

## 🚀 How to Run
1. Install [Terraform](https://developer.hashicorp.com/terraform/downloads).
2. Configure your AWS credentials (`aws configure`).
3. Initialize Terraform:
   ```bash
   terraform init
