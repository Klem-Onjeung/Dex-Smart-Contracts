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

# Hash 1011
# Hash 9069
# Hash 5994
# Hash 2589
# Hash 4140
# Hash 4077
# Hash 2099
# Hash 7501
# Hash 1359
# Hash 3697
# Hash 5501
# Hash 9264
# Hash 9454
# Hash 2597
# Hash 7716
# Hash 2127
# Hash 3173
# Hash 3071
# Hash 7148
# Hash 7996
# Hash 8060
# Hash 4111
# Hash 2186
# Hash 6017
# Hash 9486
# Hash 8255
# Hash 4867
# Hash 3539
# Hash 6813
# Hash 1128
# Hash 6407
# Hash 4826
# Hash 9041
# Hash 3114
# Hash 4188
# Hash 5835
# Hash 5758
# Hash 3225
# Hash 8304
# Hash 5983
# Hash 2801
# Hash 8694
# Hash 6751
# Hash 5664
# Hash 6255