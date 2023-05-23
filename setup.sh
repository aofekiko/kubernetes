#!/bin/bash
export KUBECONFIG=/var/run/kubernetes/admin.kubeconfig
kubectl create ns aizik-test
kubectl create sa -n aizik-test adminserviceaccount
kubectl create -f temp.yaml -n aizik-test
kubectl create clusterrolebinding --clusterrole=cluster-admin --serviceaccount=aizik-test:adminserviceaccount clusteradmin 
kubectl describe secret adminserviceaccount-token -n aizik-test
kubectl create cm --from-file=SUPPORT.md -n aizik-test configmap
