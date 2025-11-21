#!/bin/bash
aws eks --region us-east-1 update-kubeconfig --name brain-tasks-cluster
kubectl apply -f k8s/deployment.yaml
