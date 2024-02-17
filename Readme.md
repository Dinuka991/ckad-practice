# Docker Commands 

##### Run the instance of the image 

```docker run <image-name>```

##### list the containers 

```docker ps```

container only live as long as task running 

#####  specify the task as argument 

```docker run ubuntu sleep 5 ```

## Minikube commands

```minikube start```

# Kubernetes Command Reference

## Pods


#### Get Pods

```kubectl get pods```

#### Get Yaml file by giving pod name 

```kubectl get pods <pod-name>  -o yaml > pod.yaml```

#### Update Pod

get the yaml file using above command and then open using vi editor, then update
the required changes and apply the changes. 

```kubectl apply -f pod.yaml```

update the image file without opening yaml file

```kubectl set image pod/pod-name container-name=image:tag```

#### Describe Pod

```kubectl describe pod pod-name```

#### Delete Pod 

```kubectl delete pod pod-name```
#### Edit Pod 

```kubectl apply -f pod.definition.yaml```

If you have a pod definition file (pod.definition.yaml), you can edit it directly and apply the changes using this command.

If you need to extract the definition of a pod to a file:

Can not edit specifications of an existing POD. other than below 

specs.containers[*].image
spec.activeDeadlineSeconds
spec.activeDeadlineSeconds
specs.tolerations 




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

#### Get all namespaces

```kubectl get  namespaces```

#### get pods from another namespace

```kubectl get pods --namespace=kube-system```

#### get all pods from dev 

```kubectl get pods --namespace=dev```

#### create namespace 

```kubectl crate -f namepace-dev.yaml```

#### Switch the namespaces 

```kubectl config set-context $(kubectl config current-context) --namespace=dev```

####  Get pods from all namespaces 

```kubectl get pods --all-namespaces```

#### create pod in finance namespace 

```kubectl get pods -n=finance```

#### get service in the namespace

```kubectl get svc -n=marketing```

## Imperative commands 


#### Deploy a pod 

```kubectl run <podname> --image=<image-name> --labels <labelaname> = <labele value>```

#### create a new service to expose application

##### create a service named redis-service of ClusterIP to exposed pod redis on port 6379

```kubectl expose pod redis --port=6379 --name redis-service --dry-run=client -o yaml```

##### Without pass selectors 

```kubectl create service clusterip redis-service --tcp=6379:6379 --dry-run=client -o yaml | kubectl apply -f -```

#### create deployment using imperative command

```kubectl create deployment webapp --image=kodekloud/webapp-color --replicas=3```

#### create pod with expose the port

```kubectl run custom-nginx --image=nginx --port=8080```

#### create namespace imperative 

```kubectl create ns dev-ns```

#### create new deployment with image and replicas 

```kubectl create deployment redis-deploy --image=redis --namespace=dev-ns --replicas=2```


#### Create a pod called httpd using the image httpd:alpine in the default namespace. Next, create a service of type ClusterIP by the same name (httpd). The target port for the service should be 80

```kubectl run httpd --image=httpd:alpine --port=80 --expose```



## Config Map

#### Create config map declarative way

##### Imp way

```kubectl create cm webapp-config-map  --from-literal=<NAME>=<value>```

##### dec way

```kubectl create -f cnfig-map.yml```

#### Imperative way 

```kubectl create config \```
```  ```
```<config-name>  --form-literal=<key>=<value>```

#### giving file path 

```kubectl create config \```
```  ```
```<config-name>  --<form-file>=<file_to_path>```


## Encrypt Secret Data at Rest 

#### create a secret object from literal 

``` kubectl create secret generic my-secret --from-literal=key1=supersecret --from-literal=key2=topsecret```

#### get secret details 

```kubectl get secret my-secret1 -o yaml```

#### decode encrypted values 

```echo "-ssvsd-vsd" | base64 --decode```

## SecurityContext 




## Tips

#### Output with JSON format 

```kubectl create namespace test-123 --dry-run -o json```

#### Output with wide details 

```kubectl get pods -o wide```

#### Output with YAML format 

```kubectl create namespace test-123 --dry-run -o yaml```

#### imperative command to creat resource 

```--dry-run```

#### imperative command to test without creating resources 

```-o yaml:```

#### Modify YAML and apply changes 

```kubectl apply -f```


## Command & Arguments 









