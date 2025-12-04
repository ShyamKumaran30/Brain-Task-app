#!/bin/bash
set -e
echo "Pre-traffic check running..."
curl -I http://brain-task-service.default.svc.cluster.local || exit 1
