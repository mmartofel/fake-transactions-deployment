# Create namespace if not exists
oc new-project fake-transactions

# Delete Argo AppProject
oc delete AppProject fake-transactions -n openshift-gitops

# Delete all applications
oc delete application store-ft -n openshift-gitops
oc delete application fake-transactions -n openshift-gitops
oc delete application keycloak -n openshift-gitops
oc delete application logstash -n openshift-gitops
oc delete application elasticsearch -n openshift-gitops
oc delete application kibana -n openshift-gitops

# Add required role bondings
oc adm policy add-cluster-role-to-user cluster-admin -z default -n fake-transactions
oc adm policy add-cluster-role-to-user cluster-admin -z builder -n fake-transactions
oc adm policy add-cluster-role-to-user cluster-admin -z deployer -n fake-transactions
oc adm policy add-cluster-role-to-user cluster-admin -z pipeline -n fake-transactions
oc adm policy add-role-to-user admin system:serviceaccount:openshift-gitops:openshift-gitops-argocd-application-controller -n fake-transactions

# Create Argo apps deffinitions in AppProject created
oc create -f ./ocp-argo-app-definitions/fake-transactions-argo-project.yaml -n openshift-gitops
oc create -f ./ocp-argo-app-definitions/store.yaml -n openshift-gitops
oc create -f ./ocp-argo-app-definitions/fake-transactions.yaml -n openshift-gitops
oc create -f ./ocp-argo-app-definitions/keycloak.yaml -n openshift-gitops
oc create -f ./ocp-argo-app-definitions/logstash.yaml -n openshift-gitops
oc create -f ./ocp-argo-app-definitions/elasticsearch.yaml -n openshift-gitops
oc create -f ./ocp-argo-app-definitions/kibana.yaml -n openshift-gitops
