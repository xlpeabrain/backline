#!/bin/sh
set -e
# Folder is according to the name of the concourse resource calling this script
cd backline-src
echo "Environment Variables"
env

echo $K8S_CLIENT_CERT_DATA > /tmp/client-cert
echo $K8S_CLIENT_KEY_DATA > /tmp/client-key

echo "### Setting up kubeconfig"
touch /tmp/config.yml
#Setup Kubeconfig
kubectl config set-cluster k8s-cluster --server="$K8S_API" --insecure-skip-tls-verify --kubeconfig=/tmp/config.yml
kubectl config set-credentials $K8S_USER --client-certificate-data=$K8S_CLIENT_CERT_DATA --client-key-data=$K8S_CLIENT_KEY_DATA --kubeconfig=/tmp/config.yml
kubectl config set-context default --cluster=k8s-cluster --namespace="$K8S_NAMESPACE" --user="$K8S_USER" --kubeconfig=/tmp/config.yml
echo "### Kube config file"
cat /tmp/config.yml
echo "### Kube config end"

#echo "### Available contexts"
#kubectl config get-contexts --kubeconfig=/tmp/config
kubectl config use-context default --kubeconfig=/tmp/config.yml
#kubectl config current-context --kubeconfig=/tmp/config



#Test access to cluster
kubectl cluster-info --kubeconfig=/tmp/config.yml

#

