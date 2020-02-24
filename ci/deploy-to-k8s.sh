#!/bin/sh
set -e
# Folder is according to the name of the concourse resource calling this script
cd backline-src

echo "### Setting up kubeconfig"
touch /tmp/config.yml

export KUBECONFIG=/tmp/config.yml
#Setup Kubeconfig
kubectl config set-cluster k8s-cluster --server="$K8S_API" --insecure-skip-tls-verify
kubectl config set-credentials $K8S_USER --token=$K8S_TOKEN
kubectl config set-context default --cluster=k8s-cluster --namespace="$K8S_NAMESPACE" --user="$K8S_USER"
#echo "### Kube config file"
#cat /tmp/config.yml
#echo "### Kube config end"

kubectl config use-context default
kubectl config current-context

#Test access to cluster
kubectl cluster-info




