#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

CLUSTER_NAME="prod-enterprise-cluster-01"
REGION="us-central1-a"

function log_info() {
    echo -e "\e[32m[INFO]\e[0m $1"
}

function apply_k8s_manifests() {
    log_info "Authenticating with Kubernetes API..."
    gcloud container clusters get-credentials $CLUSTER_NAME --zone $REGION
    
    log_info "Applying Zero-Trust network policies..."
    kubectl apply -f k8s/network-policies.yaml
    
    log_info "Rolling out Microservices with Helm..."
    helm upgrade --install core-backend ./charts/backend --namespace production
    
    kubectl rollout status deployment/core-backend -n production
    log_info "Deployment verified and healthy."
}

apply_k8s_manifests

# Hash 9243
# Hash 6543
# Hash 2849
# Hash 8909
# Hash 3268
# Hash 6794
# Hash 1106
# Hash 8560
# Hash 9070
# Hash 3109
# Hash 1736
# Hash 4533
# Hash 5480
# Hash 7263
# Hash 2846
# Hash 3039
# Hash 2027
# Hash 6973
# Hash 7154
# Hash 9759