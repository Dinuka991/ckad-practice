# Kubernetes Command Reference

## Pods


#### Get Pods

```kubectl get pods```


#### Update Pod

```kubectl set image pod/pod-name container-name=image:tag```

#### Describe Pod

```kubectl describe pod pod-name```

#### Delete Pod 

```kubectl delete pod pod-name```
#### Edit Pod 

```kubectl apply -f pod.definition.yaml```

If you have a pod definition file (pod.definition.yaml), you can edit it directly and apply the changes using this command.

If you need to extract the definition of a pod to a file:

```kubectl get pod <pod-name> -o yaml > pod-definition.yaml```

Replace <pod-name> with the name of the pod you want to extract.

To modify the properties of a pod interactively:

```kubectl edit pod <pod-name>```

Replace <pod-name> with the name of the pod you want to edit.

## Replication Controller

```kubectl create -f rc.defintion.yaml```

## Replica Set 

#### create replica set 

```kubectl create -f replicaset-definition.yaml```

#### update replica set

```kubectl replace -f replicaset-definition.yaml```
#### Scale the replicas 

```kubectl scale --replicas=6 -f replicaset-defintion.yaml```

```kubectl scale --replicas=6 replicaset myapp-replicaset```

#### Edit the replica set 

```kubectl edit rs new-replica-set```

## Deployments 
create deployment 

```kubectl create -f deployment-definition.yaml```

get all the objects

```kubectl get all```

## Namespaces

#### get pods from another namespace

```kubectl get pods --namespace=kube-system```
















## Tips

#### Output with JSON format 

```kubectl create namespace test-123 --dry-run -o json```

#### Output with wide details 

```kubectl get pods -o wide```

#### Output with YAML format 

```kubectl create namespace test-123 --dry-run -o yaml```



