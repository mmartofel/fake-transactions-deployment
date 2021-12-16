oc delete application store -n openshift-gitops

oc create -f ./ocp-argo-app-definitions/store.yaml -n openshift-gitops
