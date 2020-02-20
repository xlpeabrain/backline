#!/bin/sh
set -e
# Folder is according to the name of the concourse resource calling this script
cd backline-src
ls
env
echo ""

#Setup Kubeconfig
kubectl config --kubeconfig=kconfig set-cluster k8s-cluster --server=$K8S-API --insecure-skip-tls-verify
kubectl config --kubeconfig=kconfig set-credentials $K8S-USER --client-certificate=$K8S-CLIENT-CERT --client-key=$K8S-CLIENT-KEY
kubectl config --kubeconfig=kconfig set-context ci --cluster=development --namespace=$K8S-NAMESPACE --user=$K8S-USER

#Test access to cluster
kubectl cluster-info

#

