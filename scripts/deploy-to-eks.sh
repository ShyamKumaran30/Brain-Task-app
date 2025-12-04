#!/bin/bash
set -e
echo "Deploying to EKS..."

AWS_REGION="us-eat-1"
EKS_CLUSTER="brain-tasks-eks"
ECR_REPO="866945988845.dkr.ecr.us-east-1.amazonaws.com/brain-task-app"
IMAGE_TAG="latest"
KUBECTL="kubectl"

# Update kubeconfig
aws eks update-kubeconfig --region $AWS_REGION --name $EKS_CLUSTER

# Option A: patch the deployment image
$KUBECTL -n <EKS_NAMESPACE> set image deployment/brain-tasks-app brain-tasks-app=$ECR_REPO:$IMAGE_TAG --record

# Option B: apply manifests (if you keep k8s manifests in repo)
# $KUBECTL -n <EKS_NAMESPACE> apply -f k8s/

echo "Deployment triggered. Waiting rollout..."
$KUBECTL -n <EKS_NAMESPACE> rollout status deployment/brain-tasks-app --timeout=180s

echo "Deployment complete."
