#!/bin/bash
set -e

# Configure kubeconfig for EKS
aws eks --region us-east-1 update-kubeconfig --name brain-tasks-cluster

# Apply Kubernetes manifests
kubectl apply -f k8s/deployment.yaml

# Wait until deployment is successful
kubectl rollout status deployment/brain-tasks-app
