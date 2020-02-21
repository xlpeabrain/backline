#!/bin/sh
set -e
# Folder is according to the name of the concourse resource calling this script
cd backline-src
echo "Environment Variables"
env

echo "### Setting up kubeconfig"
touch /tmp/config
#Setup Kubeconfig
kubectl config --kubeconfig=kconfig set-cluster k8s-cluster --server=$K8S_API --insecure-skip-tls-verify --kubeconfig=/tmp/config
kubectl config --kubeconfig=kconfig set-credentials $K8S_USER --client-certificate=$K8S_CLIENT_CERT --client-key=$K8S_CLIENT_KEY --kubeconfig=/tmp/config
kubectl config --kubeconfig=kconfig set-context default --cluster=k8s-cluster --namespace=$K8S_NAMESPACE --user=$K8S_USER --kubeconfig=/tmp/config

echo "### Available contexts"
kubectl config get-contexts --kubeconfig=/tmp/config
kubectl config use-context default --kubeconfig=/tmp/config
kubectl config current-context --kubeconfig=/tmp/config

cat /tmp/config

ping 192.168.206.10
#Test access to cluster
kubectl cluster-info dump

#

