# Docker Commands 

```docker run <image-name>```

```docker ps```

```docker run ubuntu sleep 5 ```

# Minikube commands

```minikube start```


# Pod - Commands 

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


# Deployment - Commands

```kubectl create -f deployment-definition.yaml```

```kubectl create deployment <deployment-name> --image=<image-name>```

```kubectl run <deployment-name> --image=<container-image> --restart=Always --generator=deployment/apps.v1```

```kubectl create deployment my-deployment --image=nginx --dry-run=client -o yaml > deployment.yaml```

```kubect get deployment```

```kubect apply -f deployment-definition.yaml --record```

```kubectl label deployments nginx-deployment tire=fe```

```kubectl set image deployment/my-app-deployment   nginx-container=nginx:1.91 --record```

```kubectl rollout status deployment/myapp-deployment```

```kubectl rollout history deployment/my-app```

```kubectl rollout history deployment/myapp --revision=1```

```kubectl rollout undp deployment/myapp --to-revision=1```

```kubectl scal deployment --replicas=<number>  <deployment-name>```

# Secretes - Commands 

```kubectl create secret generic <secret-name> --from-literal=<key1>=<value1> --from-literal=<key2>=<value2> ... --dry-run=client -o yaml > secret.yaml```

# ingress - Commands

```kubectl edit ingress  <name>  -n <namespace-name>```

```kubectl get ingress```

```kubectl create ingress example-ingress -n example-namespace --rule=/app=example-service:8080```

```kubectl create namespace <>```

```kubectl config set-context --current --namespace=ingress-nginx```

```kubectl create configmap ingress-nginx-controller --namespace ingress-nginx```


# ConfigMap - Commands 




## Replication Controller - Command 

```kubectl create -f rc.defintion.yaml```

## Replica Set - Commands

```kubectl create -f replicaset-definition.yaml```

```kubectl replace -f replicaset-definition.yaml```

```kubectl scale --replicas=6 -f replicaset-defintion.yaml```

```kubectl scale --replicas=6 replicaset myapp-replicaset```

```kubectl edit rs new-replica-set```





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

# Helm Command

```helm help```

#####  Search repo in artifact hub 

```helm search hub wordress```

#####  Add the local to bitnami

```helm repo add bitnami <url>```

##### search added repo

```helm search repo wordpress```

##### Once find the chart need to install the chart

```helm install <release-name>  <chart-name>```

##### List the downloaded packages3

```helm list```

##### List down downlos

```helm repo list```

##### Download but don't need to install 

```helm pull  -untar bitnami/wordpress```




```helm install wwordpress```

```helm update wordpress```

```helm rollback wordpress```

```helm uninstall wordpress```

```helm list```

```helm uninstall my-release```

```helm pull --unstar bitnami/wordpress```

```ls wordpress```

```helm install release-4 ./wordpress```

```helm search hub wordpress```

``` helm repo add bitnami https://charts.bitnami.com/bitnami```

```helm install webapp-color-apd /opt/<helm_chart_directory> namespace frontend-apd --set service.type=NodePort --set replicaCount=3 --set image.tag=1.20.0```

##### Home many repos in the node

``help repo list``

#####  install helm chart from the bitnami repo released name bravo

```helm install bravo bitnami/drupal```

##### Search for wordpress helm chart package from the Artifact hub

```helm search hub wordpress```

##### Which command is used to search for the joomla package from the added repository?

```help search repo joomla```

##### Download the bitnami apache package under the /root directory

```helm pull --untar  bitnami/apache```



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




# service 

```kubectl expose <resource-type> <resource-name> --port=<port> --name=<service-name> --target-port=<target-port> --type=<service-type>```




```kubectl expose <resource-type> <resource-name> --port=<port> --name=<service-name> --target-port=<target-port> --type=<service-type>```

# INGRESS

An Ingress Controller is responsible for managing external access 
to services within a Kubernetes cluster. Two popular Ingress Controllers are NGINX and Contour. Here, we'll focus on NGINX.


```kubectl create ingress example-ingress --rule=example.com/=/ --default-backend=example-service:80```


### Usage

#### To create an Ingress resource:

```kubectl create ingress <ingress-name> --rule="host/path=service:port"```

#### To edit an existing Ingress:

```kubectl edit ingress --namespace <namespace-name>```

#### To view all Ingress resources:

```kubectl get ingress```


### Editing Ingress

To edit an existing Ingress resource:

```kubectl edit ingress <name> -n <namespace-name>```





#### Ingress resources 

#### Ingress rules 

rules defined the routs base on URL. 

```kubectl create ingress <ingress-name>  --rule="host/path=service:port""```


```kubectl edit ingress --namespace app-space```







### Authorization 

#### Node

```kubectl describe pod kube-apiserver-controlplane -n kube-system```


#### create a role 

```kubectl create role developer --verb=list,create,delete  --resources=pods```

#### create a role binding 

```kubectl create rolebinding dev-user-binding --role=developer --user=dev-user```




























