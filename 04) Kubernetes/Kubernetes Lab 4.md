## Services
1. How many Services exist on the system?
```sh
kubectl get services --no-headers | wc -l
```
2. What is the type of the default Kubernetes Service?
-> `ClusterIP`
3. What is the `targetPort` configured on the Kubernetes Service?
-> Pod's port which the service forwards traffic to.
4. How many labels are configured on the Kubernetes Service?
```sh
kubectl get service kubernetes --show-labels
```
5. How many Endpoints are attached on the Kubernetes Service?
```sh
kubectl get endpoints kubernetes
```
-----------
6. Create a Deployment using the below YAML:
```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: simple-webapp-deployment
  namespace: default
spec:
  replicas: 4
  selector:
    matchLabels:
      name: simple-webapp
  strategy:
    rollingUpdate:
      maxSurge: 25%
      maxUnavailable: 25%
    type: RollingUpdate
  template:
    metadata:
      creationTimestamp: null
      labels:
        name: simple-webapp
    spec:
      containers:
      - image: kodekloud/simple-webapp:red
        imagePullPolicy: IfNotPresent
        name: simple-webapp
        ports:
        - containerPort: 8080
          protocol: TCP
```
7. What is the image used to create the pods in the deployment?
-> `kodekloud/simple-webapp:red`
8. Create a new service to access the web application with the below properties:
```
Name: webapp-service
Type: NodePort
targetPort: 8080
port: 8080
nodePort: 30080
selector:
  name: simple-webapp
```
-> `webapp-svc.yaml`
```yaml
apiVersion: v1
kind: Service
metadata:
  name: webapp-service
spec:
  type: NodePort
  selector:
    name: simple-webapp
  ports:
    - targetPort: 8080
      port: 8080
      nodePort: 30080
```
1. Apply the Service:
```sh
kubectl apply -f webapp-svc.yaml
```
2. Get the Node IP:
```sh
kubectl get nodes -o wide
```
3. Access the web app:
```sh
curl <node-ip>:30080
```
---
---
## ConfigMaps and Secrets
1. List ConfigMaps exist in the system?
```sh
kubectl get cm   # configmaps
```
2. List Secrets exist in the system?
```sh
kubectl get secret
```
3. Create a ConfigMap named app-config with the following data:
```yaml
apiVersion: v1
kind: ConfigMap
metadata:
  name: app-config
  namespace: default
data:
  APP_ENV: production
  LOG_LEVEL: debug
```
4. What are the key-value pairs configured in the ConfigMap named app-config?
-> `(APP_ENV, production) and (LOG_LEVEL, debug)`
5. Create a Secret named db-secret with the following data:
```yaml
apiVersion: v1
kind: Secret
metadata:
  name: db-secret
  namespace: default
type: Opaque
data:
  username: dXNlcm5hbWU=  # base64 encoded
  password: cGFzc3dvcmQ=  # base64 encoded
```
6. What are the decoded key-value pairs configured in the Secret named db-secret?
```sh
echo "dXNlcm5hbWU=" | base64 -d
```
-> `username`
```sh
base64 -d <<< "cGFzc3dvcmQ=" && echo
```
-> `password`
7. Create a Pod that uses the ConfigMap and Secret created above:
```yaml
apiVersion: v1
kind: Pod
metadata:
  name: app-pod
  namespace: default
spec:
  containers:
  - name: app-container
    image: busybox
    command: [ "sh", "-c", "env && sleep 60" ]
    env:
    - name: APP_ENV
      valueFrom:
        configMapKeyRef:
          name: app-config
          key: APP_ENV
    - name: LOG_LEVEL
      valueFrom:
        configMapKeyRef:
          name: app-config
          key: LOG_LEVEL
    - name: DB_USERNAME
      valueFrom:
        secretKeyRef:
          name: db-secret
          key: username
    - name: DB_PASSWORD
      valueFrom:
        secretKeyRef:
          name: db-secret
          key: password
```
8. Verify that the Pod has the correct environment variables set by checking its logs.
```sh
kubectl logs app-pod
```
or
```sh
kubectl exec -it app-pod -- env
```
---
---
## Service Accounts:
1. How many Service Accounts exist in the all namespaces?
```sh
kubectl get sa --all-namespaces   # -A
```
2. Create a Service Account named my-service-account in the default namespace:
```sh
kubectl create serviceaccount my-service-account
```
3. Which namespace is the Service Account my-service-account created in?
```sh
kubectl describe sa my-service-account
```
-> `default`
## Role and Rolebinding:
1. Create a Role named `pod-reader` in the default namespace with permissions to list and get pods:
```yaml
apiVersion: rbac.authorization.k8s.io/v1
kind: Role
metadata:
  namespace: default
  name: pod-reader
rules:
- apiGroups: [""]
  resources: ["pods"]
  verbs: ["get", "list"]
```
or
```sh
kubectl apply -f - <<EOF
apiVersion: rbac.authorization.k8s.io/v1
kind: Role
metadata:
  namespace: default
  name: pod-reader
rules:
- apiGroups: [""]
  resources: ["pods"]
  verbs: ["get", "list"]
EOF
```
2. Create a RoleBinding named `read-pods` that binds the `pod-reader` Role to the `my-service-account` Service Account:
```sh
kubectl create rolebinding read-pods --role=pod-reader --serviceaccount=default:my-service-account
```
3. Which Service Account is the RoleBinding `read-pods` bound to?
```sh
kubectl describe rolebinding read-pods
```
-> `my-service-account`
## ClusterRoles and ClusterRoleBindings:
1. Create a ClusterRole named `namespace-admin` with permissions to list, get, create, and delete namespaces:
```yaml
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRole
metadata:
  name: namespace-admin
rules:
- apiGroups: [""]
  resources: ["namespaces"]
  verbs: ["get", "list", "create", "delete"]
```
Or
```sh
kubectl apply -f - <<EOF
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRole
metadata:
  name: namespace-admin
rules:
- apiGroups: [""]
  resources: ["namespaces"]
  verbs: ["get", "list", "create", "delete"]
EOF
```
2. Create a ClusterRoleBinding named `admin-namespaces` that binds the `namespace-admin` ClusterRole to the `my-service-account` Service Account in the `default` namespace:
```sh
kubectl create clusterrolebinding admin-namespaces --clusterrole=namespace-admin --serviceaccount=default:my-service-account
```
3.Which ClusterRole is the ClusterRoleBinding `admin-namespaces` bound to?
-> `namespace-admin`
## Namespaced Resources
1. Create a Pod named `test-pod` in the `default` namespace using the `my-service-account`:
```yaml
apiVersion: v1
kind: Pod
metadata:
  name: test-pod
  namespace: default
spec:
  serviceAccountName: my-service-account
  containers:
  - name: nginx
    image: nginx
```
2. Verify that the Pod `test-pod` is using the Service Account `my-service-account`:
```sh
kubectl get pod test-pod -o jsonpath='{.spec.serviceAccountName}'
```
---
---