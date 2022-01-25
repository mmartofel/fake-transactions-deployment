oc adm policy add-cluster-role-to-user cluster-admin -z default -n fake-transactions
oc adm policy add-cluster-role-to-user cluster-admin -z builder -n fake-transactions
oc adm policy add-cluster-role-to-user cluster-admin -z deployer -n fake-transactions
oc adm policy add-cluster-role-to-user cluster-admin -z pipeline -n fake-transactions
