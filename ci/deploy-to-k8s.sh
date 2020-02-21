#!/bin/sh
set -e
# Folder is according to the name of the concourse resource calling this script
cd backline-src
echo "Environment Variables"
env

echo "### Setting up kubeconfig"
touch /tmp/config.yml
#Setup Kubeconfig
kubectl config set-cluster k8s-cluster --server="$K8S_API" --insecure-skip-tls-verify --kubeconfig=/tmp/config.yml
echo "$K8S_CLIENT_CERT"
kubectl config set-credentials $K8S_USER --client-certificate="$K8S_CLIENT_CERT" --client-key="$K8S_CLIENT_KEY" --kubeconfig=/tmp/config.yml
kubectl config set-context default --cluster=k8s-cluster --namespace="$K8S_NAMESPACE" --user="$K8S_USER" --kubeconfig=/tmp/config.yml
echo "### Kube config file"
cat /tmp/config
echo "### Kube config end"

#echo "### Available contexts"
#kubectl config get-contexts --kubeconfig=/tmp/config
#kubectl config use-context default --kubeconfig=/tmp/config
#kubectl config current-context --kubeconfig=/tmp/config



#Test access to cluster
#kubectl cluster-info --kubeconfig=/tmp/config

#

