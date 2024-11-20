- It is a method of regulating access to computer or network resources based on the roles of individual users within your organization.
- RBAC authorization uses the `rbac.authorization.k8s.io` API group to drive authorization decisions, allowing you to dynamically configure policies through the Kubernetes API.
- The RBAC API declares four kinds of Kubernetes objects: `Role`, `ClusterRole`, `RoleBinding` and `ClusterRoleBinding`.
---
## Role
- **Namespaced**: a Role always sets permissions within a particular namespace; when you create a Role, you have to specify the namespace it belongs in.
### Example: Grant Read Access to Pods
```yaml
apiVersion: rbac.authorization.k8s.io/v1
kind: Role
metadata:
  namespace: default
  name: pod-reader
rules:
- apiGroups: [""] # "" indicates the core API group
  resources: ["pods"]
  verbs: ["get", "watch", "list"]
```
---
## ClusterRole
- **Non-namespaced resource**
- Can be used to grant the same permissions as a Role. Because ClusterRoles are cluster-scoped.
### Example: Grant Read Access to Secrets in any particular namespace, or across all namespaces (depending on how it is bound)
```yaml
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRole
metadata:
  # "namespace" omitted since ClusterRoles are not namespaced
  name: secret-reader
rules:
- apiGroups: [""]
  # At the HTTP level, the name of the resource for accessing Secret
  # objects is "secrets"
  resources: ["secrets"]
  verbs: ["get", "watch", "list"]
```
***If you want to define a role within a namespace, use a Role; if you want to define a role cluster-wide, use a ClusterRole.***

---
## RoleBinding
- Grants the permissions defined in a role to a user or set of users.
- A RoleBinding may reference any Role in the same namespace. 
- A RoleBinding can reference a ClusterRole and bind that ClusterRole to the namespace of the RoleBinding. If you want to bind a ClusterRole to all the namespaces in your cluster, you use a ClusterRoleBinding.
### Example: Grant the `pod-reader` Role to the User `jane` within the `default` Namespace
```yaml
apiVersion: rbac.authorization.k8s.io/v1
# This role binding allows "jane" to read pods in the "default" namespace.
# You need to already have a Role named "pod-reader" in that namespace.
kind: RoleBinding
metadata:
  name: read-pods
  namespace: default
subjects:
# You can specify more than one "subject"
- kind: User
  name: jane # "name" is case sensitive
  apiGroup: rbac.authorization.k8s.io
roleRef:
  # "roleRef" specifies the binding to a Role / ClusterRole
  kind: Role #this must be Role or ClusterRole
  name: pod-reader # this must match the name of the Role or ClusterRole you wish to bind to
  apiGroup: rbac.authorization.k8s.io
```
---
## ClusterRoleBinding
- To grant permissions across a whole cluster, you can use a ClusterRoleBinding.
### Example: Allow any user in the group `manager` to read secrets in any namespace.
```yaml
apiVersion: rbac.authorization.k8s.io/v1
# This cluster role binding allows anyone in the "manager" group to read secrets in any namespace.
kind: ClusterRoleBinding
metadata:
  name: read-secrets-global
subjects:
- kind: Group
  name: manager # Name is case sensitive
  apiGroup: rbac.authorization.k8s.io
roleRef:
  kind: ClusterRole
  name: secret-reader
  apiGroup: rbac.authorization.k8s.io
```
---