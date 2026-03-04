# Kubernetes Demo

## 📌 Overview
This demo project shows how to deploy a simple **Nginx application** on Kubernetes using a Deployment and Service.  
It is meant to demonstrate my **container orchestration** skills, not a production setup.

---

## ⚙️ What It Does
- Creates a Deployment named `obi-demo-app` with 2 replicas.
- Runs the `nginx:latest` container image.
- Exposes the application on port 80.
- Demonstrates how Kubernetes manages scaling and availability.

---

## 🛠️ Files
- **deployment.yaml** → Defines the Deployment and Pod template for the Nginx app.
- *(Optional)* `service.yaml` → Can be added to expose the app externally via NodePort or LoadBalancer.

---

## 🚀 How to Run
1. Install [kubectl](https://kubernetes.io/docs/tasks/tools/) and connect to a Kubernetes cluster (e.g., Minikube, EKS, GKE).
2. Apply the deployment:
   ```bash
   kubectl apply -f deployment.yaml
