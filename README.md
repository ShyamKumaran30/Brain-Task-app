 Brain Tasks App — AWS CI/CD & Kubernetes Deployment

This project demonstrates a complete, production-ready deployment pipeline for the **Brain Tasks App**, a front-end application built with modern web technologies and deployed on **Amazon EKS** using a fully automated **CI/CD pipeline**.

The solution follows DevOps best practices and implements containerization, artifact management, Kubernetes orchestration, automated deployment, and cloud-native infrastructure design.

---

#Project Overview

The Brain Tasks App is deployed using:

- **Docker**
- **Amazon Elastic Container Registry (ECR)**
- **Amazon Elastic Kubernetes Service (EKS)**
- **Kubernetes Deployments & Services**
- **AWS CodeBuild** (Build & Deploy stages)
- **AWS CodePipeline** (CI/CD automation)
- **IAM Roles & Kubernetes RBAC**
- **Application LoadBalancer Service**

The application is built and served through a container running **NGINX on port 3000**.

---

##  Features

### **Application & Containerization**
- Dockerized React/Vite front-end application  
- Production build served through NGINX  
- Container exposes port 3000  

### **AWS Infrastructure**
- Dedicated **ECR** repository for secure image storage  
- **EKS** cluster with node group for pod scheduling  
- Kubernetes **Deployment** for stateless workloads  
- Kubernetes **LoadBalancer Service** for public access  

### **CI/CD Pipeline (CodePipeline)**
- GitHub integration for automatic triggers  
- Build stage to build/push Docker images  
- Deploy stage to apply Kubernetes manifests  
- Full automation on every git push  

### **IAM & Security**
- Proper IAM roles for CodePipeline & CodeBuild  
- Kubernetes RBAC integration through `aws-auth`  
- Limited and secure permissions for CI/CD services  

---

##  Architecture Summary

The architecture includes:

1. Local project code pushed to GitHub  
2. AWS CodePipeline monitoring GitHub for changes  
3. CodeBuild (Build project) to create and push Docker images  
4. CodeBuild (Deploy project) to update EKS cluster  
5. ECR for versioned container storage  
6. EKS to run the containerized application  
7. LoadBalancer service for public access  

This setup enables **zero-downtime rolling updates** and fully automated deployments.

---

## ☸️ Kubernetes Components

- **Deployment:** Manages application pods and ensures desired replica count  
- **Service (LoadBalancer):** Exposes the application publicly  
- **aws-auth ConfigMap:** Grants CodeBuild deploy role access to Kubernetes  
- **Rolling Updates:** Ensures smooth transitions between versions  

---

##  CI/CD Workflow

1. Developer pushes a commit to GitHub  
2. CodePipeline detects changes  
3. Build stage runs on CodeBuild  
4. Docker image is built and pushed to ECR  
5. Deploy stage uses CodeBuild to:  
   - Connect to EKS  
   - Apply Kubernetes YAML files  
   - Perform rolling updates  
6. Application pods update automatically  
7. LoadBalancer serves the new version  

---

##  Public Access

After deployment, the application becomes accessible via an **AWS LoadBalancer DNS URL**
http://a14f023ec69034f9c8b93f6109a82fd2-177865057.us-east-1.elb.amazonaws.com.  
This URL updates automatically as the Kubernetes Service is recreated or replaced.

---

##  Deployment Checklist

### **Repository & Application**
- Application cloned from GitHub  
- Production build available  
- Dockerfile created and verified  

### **Docker & ECR**
- Docker image built successfully  
- ECR repository created  
- Image pushed to ECR  

### **EKS & Kubernetes**
- EKS cluster created  
- Node group added  
- `kubectl` configured  
- Deployment and Service applied  
- LoadBalancer created and reachable  

### **CI/CD Pipeline**
- CodePipeline created  
- Build stage set up with CodeBuild  
- Deploy stage set up with CodeBuild  
- IAM permissions configured  
- Kubernetes RBAC (`aws-auth`) configured  
- Pipeline executes successfully end-to-end  

---

## 🔐 Permissions & Security

To enable pipeline deployment:

- CodeBuild service role added to `aws-auth` ConfigMap  
- IAM roles updated with EKS and ECR permissions  
- Pipeline service role granted CodeBuild execution rights  
- Kubernetes RBAC and IAM integration ensure secure and controlled deployment operations  

---

## 📸 Recommended Documentation Items

Recommended screenshots for project submission:

- GitHub repository  
- ECR repository with image tags  
- EKS cluster and node groups  
- `kubectl` outputs (nodes, pods, svc)  
- CodeBuild Build & Deploy logs  
- CodePipeline execution visualization  
- LoadBalancer URL working in browser  

---

##  Final Status

This repository successfully implements:

- Complete application containerization  
- Fully functional EKS deployment  
- Automated CI/CD pipeline  
- Zero-downtime rolling deployments  
- Reliable cloud-native infrastructure  
- End-to-end DevOps delivery pipeline  

The system is fully operational and automatically deploys updates when changes are pushed to GitHub.
