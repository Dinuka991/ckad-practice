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

#### run a command inside pod 

```kubectl exec ubuntu -- whoami```

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

```kubeclt create deployment <name> --image=<image-name> --replicas=<no-of-replicas>```

```kubectl label deployments nginx-deployment tire=fe```

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

#### identify the user who execute the sleep process


```kubectl exec ubuntu-sleeper -- whoami```


## Service Accounts 

#### into 

there two type of accounts in kb. service acc and user acc

#### create service acc

```kubectl create serviceaccount <acc-name>```


## Resource Requirements

##### Intro 

Every pod need set of resources to run.  Scheduler decide which node pods goes to. Identify the best node pods run.
If node dosen't have sufficent resources then scheduler will assinged the pod to another nod. if any of the
node dosent have siffcient resouece will move to pending . 


CPU 0.1 = 100M

1 CPU = 1 AWS / 1 GCP core / 1 Azure Core / 1 Hyperthread 


Behaviour CPU

Without limit pod can consume all the resource of CPU 

## Taints and Tolerations 

Taints and Tolerations are mechanisms to control which pods can be scheduled onto which nodes in
cluster. 


Taints : Taints are applied to nod to repel pods. they prevent pods from being scheduled onto
nodes unless the pod has a matching "toleration" for that taint. 

Tolerations: Tolerations are applied to pods and specify that the pod can tolerate nodes 
with specific taints. 

#### Taint a node 

```kubectl taint nodes <node-name> key=value:effect```

Effect either be NoSchedule | PreferNoSchedule | NoExecute 

```kubectl taint node node1 app=blue:NoSchedule```

#### Apply a Toleration to a Pod 

Toleration are add the Pod.

#### To see taints details

```kubectl describe node kubemaster | grep Taint```

#### To remove the taints 

```kubectl taint node <taint-name>-```


## Node Seclectors 

#### Label the nodes 

```kubectl label nodes <node-name> <label-key>=<label-value>```

## Node Affinity 




## Multi-Container Pods 

There three type of multi container pods in kubernets. those are Ambassador,Adapter
and Sidecar. 

#### Example of sidecar patter

Purpose: Extends the functionality of the main container by adding a helper container.
Example: You have a web server and a log agent. Both reside in the same pod, sharing the same volume for logs. The log agent collects and processes logs from the web server without modifying its core functionality.
Benefits: Modular design, easier scaling of helper containers, independent lifecycles for main and helper containers

#### Example of Ambassdor 

Purpose: Acts as a proxy or mediator between the main container and external services.
Example: Your application interacts with three databases: production, development, and user acceptance testing (UAT). An Ambassador container routes traffic to the appropriate database based on configuration or load balancing.
Benefits: Abstracts service discovery and routing from the main container, simplifies communication with external services, improves resilience and scalability.

##### Adapter design pattern

Purpose: Adapts data formats or protocols between the main container and other services.
Example: Different containers in your application generate logs in various formats. An Adapter container collects these logs, standardizes the format, and then sends them to a central logging server.
Benefits: Ensures consistent data format for consumption by downstream systems, simplifies integration with heterogeneous components.

#### see log 

```kubectl -n elastic-stack exec -it app -- cat /log/app.log```

## Tips

#### checkout to another namespace

```kubectl config set-context $(kubectl config current-context) --namespace=<desired-namespace>```

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







## Observability 

#### Readiness and Liveness Probes 

The lifecycle of pods consists three main stages:pending , containerCreating and running.
Pod conditions include PodScheduled, Initialized , ContainersReady and Ready. 

Typically , Kubernetes does not wait for all applications inside containers to be up and running before
showing as ready. This premature readiness status can lead to issues. To mitigate this, utilize the 
##### readinessProbe.

this allows you to define test scenarios to ensure that services inside the containers are up and running properly. 

##### Liveness Probe

In addition to readinessProbe , livenessProbe is used to health test applications. As kubernetes is an 
orchestration service, it has the capability to automatically restart failed containers. However ,In 
Scenarios where a container repeatedly fails due to issues, Kubernetes may enter an infinite restart loop.
To mitigate this , livenessProbe can be utilized. 

LivenessProbe allows you to define health checks for your application.Kubernetes periodically performs these 
checks , and if the application fail the check, Kubernetes will restart the container to restore its health. 


##### Logging 


##### to see the logs in docker 

```docker logs -f ecf```
##### to run the detach mood in docker

```docker run -d kodekcloud/event-simulator```


##### to see the logs in kubernetes 

```kubectl logs -f <pod-name> <container-name>```

##### Monitor and debug application 

```git clone https://github.com/kodekloudhub/kubernetes-metrics-server.git```

```kubectl create -f .```

```minukube addons enable metrics-server```

```kubectl top node```

```kubectl top pod```

# POD Design 

## Labels

labels are properties to add each items. 


##### select the pods with lables 

```kubectl get pods --selector app=App1```

#### get the count of pod 

```kubectl get pods --selector env=dev --no-headers | wc -l```

#### get the pod with multiple selectors 

```kubectl get  all -selectors  <key>=<value> , <key2>=<value2> , <key3>=<value> | wc -l```





## Rolling update and rollback deployments 



If you first create deployment it will trgger a rollout. New rollout create a new deployment revision. In future
once application updated new rollout will trigger and new reployment version will be created. this help us to maintain
a history about rollout and rollback to previous version if necessary. 

```kubectl rollout status deployment/myapp-deployment```
```kubectl rollout  history deployment/<name>```

There two type of rollout strategies. 

Recreate Strategy 

Destroy all the containers of current version and deploy the new version. Disadvantage of  this application 
will have a downtime. 

Rolling Update 

rolling update is default deployment strategy. In here take down previous version
of deployment one by one and take up new version one by one. In this way application never goes down. 


#### rollout command 

```kubectl rollout  -h```
```kubectl rollout status -h```
```kubectl rollout deployment```


there few ways to update the deployment.

##### Option-1 (To update deployment)

update the definition file and use the below apply command. 

```kubectl apply -f <defile name>```

##### Option-2(To update deployment)

update the image name with set command , in this way will have conflicts with definition file with deployment as
definition can not update using this command. 

To identify the strategy can use describe command and it will show the strategy type. 

##### Rollback 

Rollback will allow to rollback the changes to previous version 

```kubectl rollout undo  deployment/<app-name>```



```kubectl set image=<new-image>``` <deployment-name>


```kubectl rollout status deployment/<app-name>```

```kubectl rollout history deployment/<app-name>```

```kubectl rollout undo deployment/<app-name>```


#### scale the deployment 

```kubectl scal deployment --replicas=<number>  <deployment-name>```



```kubectl create job throw-dice-job --image=kodekloud/throw-dice --dry-run=client -o yaml  > throw-dice-job.yaml```


## Service Types

Kubernetes service use to communicate between pods within node as well
pod outside the cluster. Services help to make available apllication 
to end users. and help the conections to extranal services as well
make loose couple microservices. 





NodePort

Service make acceble internal pods from the node. Service listen the pod in the node and forwered request to


NodePort (Port in the  node) -> Service Port (Port in the pod) -> TargetPort (Port in the pod)


ClusterIp

Make virtual IP to communicate between extranel services.  Such as frontend server to backend. Cluster ip use communicate
between the services.

LoadBlancer

Make distribute the load among the pods


### INGRESS


#### How simple application deploy 

You  build the application in docker image deploy to kubernetes cluster as pod
in deployment. Application need a  database so database also deploy as a pod and
create a service call cluster ip called mysql service make it accessable to applicaton.
To make application accessable to outside create a another service called 
NodePort.  point to dns server to IP of the node.


#### Ingress controller 

GCP .NGINX ,Contour

##### NGINX

NGINX provide NGINX server which include the load balancer , ssl and ect.
Need to setup a config map to connect with NGINX.


ingress controller included  NGINX deployment , service , configMap and Auth.

Ingress resource is created with kubernetes definition file. 
Ex - Ingress-wear.yaml 

#### Ingress resources 

#### Ingress rules 

rules defined the routs base on URL. 

```kubectl create ingress <ingress-name>  --rule="host/path=service:port""```

















