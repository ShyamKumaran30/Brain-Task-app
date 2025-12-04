#!/bin/bash
set -e

echo "=== Updating kubeconfig for EKS ==="
aws eks update-kubeconfig --name brain-tasks-eks --region us-east-1

echo "=== Applying Kubernetes manifests ==="
kubectl apply -f /opt/codedeploy/deployment/k8s/

echo "=== Waiting for rollout to complete ==="
kubectl rollout status rollout/brain-task-app --timeout=300s

echo "=== Deployment to EKS completed successfully ==="
