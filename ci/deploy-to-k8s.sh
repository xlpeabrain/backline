#!/bin/sh
set -e
# Folder is according to the name of the concourse resource calling this script
cd backline-src
env

#Setup Kubeconfig
kubectl config --kubeconfig=kconfig set-cluster k8s-cluster --server=((k8s-api)) --insecure-skip-tls-verify
kubectl config --kubeconfig=kconfig set-credentials ((k8s-user)) --client-certificate=((k8s-client-cert)) --client-key=((k8s-client-key))
kubectl config --kubeconfig=kconfig set-context ci --cluster=development --namespace=((k8s-namespace)) --user=((k8s-user))

#Test access to cluster
kubectl cluster-info

#

