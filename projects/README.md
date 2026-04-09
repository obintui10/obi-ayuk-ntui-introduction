# 🚀 Advanced Terraform AWS EC2 Demo

## 📌 Overview
This project demonstrates a **production‑grade Terraform configuration** for provisioning an AWS EC2 instance.  
It highlights **Infrastructure as Code (IaC)** best practices, secure networking, automated provisioning, and observability — moving beyond a simple demo into **enterprise‑ready design**.

---

## ⚙️ What It Does
- Configures AWS provider (`us-east-1` region).
- Creates an EC2 instance with **user_data automation** (Apache web server + demo landing page).
- Applies **least‑privilege security groups** (restricted SSH, open HTTP).
- Associates an **Elastic IP** for stable access.
- Sets up a **CloudWatch alarm** for proactive CPU monitoring.
- Uses **variables and tags** for modularity and environment separation.

---

## 🛠️ Files
- **main.tf** → Core Terraform configuration.
- **variables.tf** → Parameterized values (instance type, project name, etc.).
- **outputs.tf** → Useful outputs (Elastic IP, instance ID, alarm name).
- **README.md** → Documentation for recruiters and collaborators.

---

## 🚀 How to Run
1. Install [Terraform](https://developer.hashicorp.com/terraform/downloads).
2. Configure AWS credentials:
   ```bash
   aws configure
