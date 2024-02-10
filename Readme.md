# Kubernetes Command Reference

## Get Pods

```kubectl get pods```


## Update Pod

```kubectl set image pod/pod-name container-name=image:tag```

## Describe Pod

```kubectl describe pod pod-name```

## Delete Pod 

```kubectl delete pod pod-name```
## Edit Pod 

```kubectl apply -f pod.definition.yaml```

If you have a pod definition file (pod.definition.yaml), you can edit it directly and apply the changes using this command.

If you need to extract the definition of a pod to a file:

```kubectl get pod <pod-name> -o yaml > pod-definition.yaml```

Replace <pod-name> with the name of the pod you want to extract.

To modify the properties of a pod interactively:

```kubectl edit pod <pod-name>```

Replace <pod-name> with the name of the pod you want to edit.

## Replica set 

```apiVersion: v1```

```kind: ReokicationController```

```metadata: ```

``` ```
```name: myapp-rc```

``` ```
```labels:```

``` ```
``` ```



