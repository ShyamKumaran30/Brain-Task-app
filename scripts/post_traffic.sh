#!/bin/bash
set -e
echo "Post-traffic verification..."
kubectl get pods -n default
kubectl get svc brain-task-service -n default
