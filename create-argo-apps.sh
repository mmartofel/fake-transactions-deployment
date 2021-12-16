oc delete application store -n openshift-gitops
oc delete application fake-transactions -n openshift-gitops
oc delete application keycloak -n openshift-gitops
oc delete application logstash -n openshift-gitops
oc delete application elasticsearch -n openshift-gitops
oc delete application kibana -n openshift-gitops

oc create -f ./ocp-argo-app-definitions/store.yaml -n openshift-gitops
oc create -f ./ocp-argo-app-definitions/fake-transactions.yaml -n openshift-gitops
oc create -f ./ocp-argo-app-definitions/keycloak.yaml -n openshift-gitops
oc create -f ./ocp-argo-app-definitions/logstash.yaml -n openshift-gitops
oc create -f ./ocp-argo-app-definitions/elasticsearch.yaml -n openshift-gitops
oc create -f ./ocp-argo-app-definitions/kibana.yaml -n openshift-gitops
