#!/bin/sh
set -e
# Folder is according to the name of the concourse resource calling this script
cd backline-src
env

echo "### Setting up kubeconfig"
touch /tmp/config.yml

export KUBECONFIG=/tmp/config.yml
#Setup Kubeconfig
kubectl config set-cluster k8s-cluster --server="$K8S_API" --insecure-skip-tls-verify
kubectl config set-credentials $K8S_USER --token=$K8S_TOKEN
kubectl config set-context default --cluster=k8s-cluster --namespace="$K8S_NAMESPACE" --user="$K8S_USER"

kubectl config use-context default

#Test access to cluster
kubectl cluster-info

for f in $(pwd)/k8s/*.yml ;
do
  echo "Processing $f file..."
  # take action on each file. $f store current file name
  sed -i -e 's/{app-name}/'"$APP_NAME"'/' -e 's/{image-repo}/'"$IMAGE_REPO"'/' -e 's/{image-tag}/'"$IMAGE_TAG"'/' $f
  cat $f
done


