# Docker Commands 

```docker run <image-name>```
```docker ps```
```docker run ubuntu sleep 5 ```

# Minikube commands

```minikube start```

# kubernetes command cheat sheet 

## Pod - Commands 

```kubectl run <pod-name> --image=<container-image> --restart=Never```
```kubectl run <pod-name> --image=<container-image> --restart=Never --dry-run=client -o yaml > pod.yaml```
```kubectl get pods```
```kubectl get pods <pod-name>  -o yaml > pod.yaml```
```kubectl apply -f pod.yaml```
```kubectl set image pod/pod-name container-name=image:tag```
```kubectl describe pod pod-name```
```kubectl delete pod pod-name```
```kubectl apply -f pod.definition.yaml```
```kubectl get pod <pod-name> -o yaml > pod-definition.yaml```
```kubectl exec ubuntu -- whoami```
```kubectl edit pod <pod-name>```


## Deployment - Commands 

```kubectl create deployment <deployment-name> --image=<image-name>```
```kubectl create deployment my-deployment --image=nginx --dry-run=client -o yaml > deployment.yaml```
```kubectl run <deployment-name> --image=<container-image> --restart=Always --generator=deployment/apps.v1```
```kubectl create -f deployment-definition.yaml```
```kubeclt create deployment <name> --image=<image-name> --replicas=<no-of-replicas>```
```kubectl label deployments nginx-deployment tire=fe```

## Secretes - Commands 

```kubectl create secret generic <secret-name> --from-literal=<key1>=<value1> --from-literal=<key2>=<value2> ... --dry-run=client -o yaml > secret.yaml```


## ingress - Commands

```kubectl edit ingress  <name>  -n <namespace-name>```

```kubectl get ingress```

```kubectl create ingress example-ingress -n example-namespace --rule=/app=example-service:8080```

```kubectl create namespace <>```

```kubectl config set-context --current --namespace=ingress-nginx```

```kubectl create configmap ingress-nginx-controller --namespace ingress-nginx```


## ConfigMap - Commands 


## Services - Commands 

```kubectl expose <resource-type> <resource-name> --port=<port> --name=<service-name> --target-port=<target-port> --type=<service-type>```

## Ingress  - Commands 

```kubectl create ingress example-ingress --rule=example.com/=/ --default-backend=example-service:80```

## Replication Controller - Command 

```kubectl create -f rc.defintion.yaml```

## Replica Set - Commands

```kubectl create -f replicaset-definition.yaml```

```kubectl replace -f replicaset-definition.yaml```

```kubectl scale --replicas=6 -f replicaset-defintion.yaml```

```kubectl scale --replicas=6 replicaset myapp-replicaset```

```kubectl edit rs new-replica-set```

# Application Deployment Commands 

## create deployment 
```kubectl create -f deployment-definition.yaml```
## get deployment 
```kubect get deployment```
## update deployment with record
```kubect apply -f deployment-definition.yaml --record```
```kubectl set image deployment/my-app-deployment   nginx-container=nginx:1.91 --record```
## status
```kubectl rollout status deployment/myapp-deployment```
## history
```kubectl rollout history deployment/my-app```
## get by revision
```kubectl rollout history deployment/myapp --revision=1```
## undo deployment
```kubectl rollout undp deployment/myapp --to-revision=1```




## scale the deployment

```kubectl scal deployment --replicas=<number>  <deployment-name>```

```kubectl create job throw-dice-job --image=kodekloud/throw-dice --dry-run=client -o yaml  > throw-dice-job.yaml```


## Rollback - Commands

```kubectl rollout undo  deployment/<app-name>```

```kubectl set image=<new-image>``` <deployment-name>

```kubectl rollout status deployment/<app-name>```

```kubectl rollout history deployment/<app-name>```

```kubectl rollout undo deployment/<app-name>```



## Namespaces - Commands

```kubectl get  namespaces```

```kubectl get pods --namespace=kube-system```

```kubectl get pods --namespace=dev```

```kubectl crate -f namepace-dev.yaml```

```kubectl get all -A```

```kubectl get <resourse-name>  --all-namespaces```

```kubectl config set-context $(kubectl config current-context) --namespace=dev```

```kubectl config set-context --current --namespace=<name-namespce>```

```kubectl get pods --all-namespaces```

```kubectl get pods -n=finance```

```kubectl get svc -n=marketing```


##### Monitor and debug application

```git clone https://github.com/kodekloudhub/kubernetes-metrics-server.git```
```kubectl create -f .```
```minukube addons enable metrics-server```
```kubectl top node```
```kubectl top pod```



#### Role Based Access Control Commands

```kubectl get roles```

```kubectl get rolebindings```

```kubectl describe role <role-name>```

```kubectl describe rolebindings  <bindings name>```

```kubectl auth can-i <action name>  <resource type> ```

```kubectl auth can-i <action name>  <resource type>  as <user-roleq>```


## User Access - Command

```kubectl --as dev-user create deployment nginx --image=nginx  -n blue```

```kubectl get clusterroles --no-headers  | wc -l```

```kubectl create clusterrole <role-name> --verb=* --resource=nodes```

```k api-resources```

```k auth can-i list storageclasses --as michelle```

```kubectl create clusterrole  <role-name>  --verb=get,list,watch  --resources=nodes```

```kubectl create clusterrolebinding <role-name>   --clusterrole=<role-name>  --user=<user-name>```


## security - Commands

```openssl genrsa -out dinuka.key 2048```

```openssl req -new -key dinuka.key -out dinuka.csr -subj "/CN=dinuka/O=dev/O=example.org```

```openssl x509 -req -in user.csr -CA <(minikube ssh 'cat /var/lib/minikube/certs/ca.crt') -CAkey <(minikube ssh 'cat /var/lib/minikube/certs/ca.key') -CAcreateseriaclel -out dinuka.crt -days 365```



#### Update Pod

get the yaml file using above command and then open using vi editor, then update
the required changes and apply the changes. 



update the image file without opening yaml file




#### Edit Pod 


Replace <pod-name> with the name of the pod you want to extract.

To modify the properties of a pod interactively:



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

#### Get the count 


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


## Service Types

Kubernetes service use to communicate between pods within node as well
pod outside the cluster. Services help to make available apllication 
to end users. and help the conections to extranal services as well
make loose couple microservices. 


# service 

```kubectl expose <resource-type> <resource-name> --port=<port> --name=<service-name> --target-port=<target-port> --type=<service-type>```

## Service Types

Service type specify under the specs with type attribute. Basically two types
of service which are NodePort and ClusterIP. 

### NodePort

Service make accessible  internal pods from the node.
Service listen the pod in the node and forward request to
NodePort (Port in the  node) -> Service Port (Port in the pod) -> 
TargetPort (Port in the pod)


### ClusterIp

Make virtual IP to communicate between external services.  
Such as frontend server to backend. Cluster ip use communicate
between the services.


## Ports 

LoadBlanker

Make distribute the load among the pods


```kubectl expose <resource-type> <resource-name> --port=<port> --name=<service-name> --target-port=<target-port> --type=<service-type>```

# INGRESS

An Ingress Controller is responsible for managing external access 
to services within a Kubernetes cluster. Two popular Ingress Controllers are NGINX and Contour. Here, we'll focus on NGINX.


```kubectl create ingress example-ingress --rule=example.com/=/ --default-backend=example-service:80```

### NGINX Ingress Controller

### Deployment

The NGINX Ingress Controller deployment includes:

NGINX deployment
NGINX service
ConfigMap for NGINX configuration
Authorization configurations, if required

### Ingress Resources

Ingress resources define rules and configuration for managing external 
access to services within the cluster. 
They specify routing based on URL paths.


### Usage

#### To create an Ingress resource:

```kubectl create ingress <ingress-name> --rule="host/path=service:port"```

#### To edit an existing Ingress:

```kubectl edit ingress --namespace <namespace-name>```

#### To view all Ingress resources:

```kubectl get ingress```

### Ingress Controller Pod

The Ingress Controller runs as a pod within the Kubernetes cluster. Its primary
function is to watch for Ingress resources and implement the specified rules.

### Editing Ingress

To edit an existing Ingress resource:

```kubectl edit ingress <name> -n <namespace-name>```

### Conclusion

Ingress resources and controllers are crucial for managing external 
access to services within a Kubernetes cluster. By utilizing NGINX as an Ingress Controller,
you can efficiently manage routing and access control for your applications.

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


```kubectl edit ingress --namespace app-space```

#### Ingress Controller 

Ingress controller is responsible to managing external access to services
withing a kubernetes cluster.Two popular ingress controller are
NGINX and counter.

This is typically  run as Pod withing the kubernetes cluster.

Ingress controller handle the load balancing , routing ,incoming traffic 
based  on he rules defined in the ingress resources. 

##### Ingress resources 

Ingress Resources are Kubernetes objects that define rules and configuration for managing external
access to services within the cluster.






```kubectl ```

#### Ingress Resources 

Ingress resources are kubernetes objects that define that define rules and
configuration  for managine extranel access to servoces withing the cluster. 


### Network Policies 


Basically there two type of network traffics. It's include ingress and egress. so ingress is incoming traffic and 
egress is outgoing traffic. 

Ingress Rules: These rules define how incoming traffic is allowed to reach pods within the cluster. 
They specify criteria such as source IP addresses, ports, and protocols. 

Egress Rules: These rules govern outgoing traffic from pods,
determining which destinations, ports, and protocols are permitted.
i
### State Persistence 

#### volumes 

In Kubernetes, containers have a transient lifespan, 
meaning that once they are terminated, all data within them is lost.
To overcome this limitation, volumes can be utilized to persistently store data. Each pod within Kubernetes can be configured to have its own volume
, providing a dedicated space for storing data.

#### Persistence volumes 

In the Kubernetes ecosystem, there are three primary components involved in persistent storage management: pods, persistent volumes (PV), and persistent volume claims (PVC).

##### Pods: 
These are the fundamental units of deployment in Kubernetes. Pods can consume persistent storage
by referencing a PersistentVolumeClaim (PVC) through the persistentVolumeClaim property within the pod specification. 
This property includes the name of the PVC using the claimName attribute.

##### Persistent Volumes (PV): 
These are storage resources provisioned in the cluster. PVs are independent of any particular pod and can be
dynamically provisioned or statically configured by the cluster administrator.

##### Persistent Volume Claims (PVC): 
PVCs act as requests for storage by pods. They define the storage requirements 
(such as access modes and capacity) needed by the pod. The PVCs are associated 
with specific PVs based on matching criteria like access modes (e.g., ReadWriteOnce, ReadOnlyMany, ReadWriteMany) 
and capacity.

##### Summary
To ensure a successful match between PVCs and PVs, the Kubernetes system compares 
the access modes and storage capacity specified in the PVC with those provided by available PVs. 
This matching process ensures that pods receive the required storage resources according to their defined needs.

Additionally, it's essential to consider other attributes of PVs and PVCs, such as storage class, 
reclaim policies, and volume labels, depending on the specific storage requirements and deployment 
scenarios in Kubernetes. These attributes contribute to efficient resource allocation, management, 
and lifecycle handling of persistent storage within the cluster.

### Storage classes

With storage class can provision storoage class like google storage. 




## Stateful sets 

How inprem db servers work ?

Setup master first then slaves. After that clone all the data from master to slave1. Enabled continuous replication
from master to slave.  Wait to slave 1 to be ready. clone the data from slave 1 to slave 2. Enable continuous 
replication from master to slave2.  Enable continues replication from master to slave2. Configure master address 
on slave. 

Why stateful sets ?



## Stateful Sets Introductions 





## Helm




ubectl describe pod kube-apiserver-controlplane -n kube-system

### Authorization 

#### Node

```kubectl describe pod kube-apiserver-controlplane -n kube-system```


 








#### create a role 

```kubectl create role developer --verb=list,create,delete  --resources=pods```

#### create a role binding 

```kubectl create rolebinding dev-user-binding --role=developer --user=dev-user```




### Admissions Controllers 


### API version 


























