#!/bin/sh
set -e
# Folder is according to the name of the concourse resource calling this script
cd backline-src
ls

#Setup Kubeconfig
kubectl config --kubeconfig=kconfig set-cluster k8s-cluster --server=$K8S_API --insecure-skip-tls-verify
kubectl config --kubeconfig=kconfig set-credentials $K8S_USER --client-certificate=$K8S_CLIENT_CERT --client-key=$K8S_CLIENT_KEY
kubectl config --kubeconfig=kconfig set-context default --cluster=development --namespace=$K8S_NAMESPACE --user=$K8S_USER
less ~/.kube/config

#Test access to cluster
kubectl cluster-info

#

