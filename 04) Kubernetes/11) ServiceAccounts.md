- It is a type of non-human account that provides a distinct identity in a Kubernetes cluster.
- Entities inside and outside the cluster can use a specific ServiceAccount's credentials to identify as that ServiceAccount.
- This identity is useful in various situations, including authenticating to the API server or implementing identity-based security policies.
- **Namespaced:** Each service account is bound to a Kubernetes namespace. Every namespace gets a `default` ServiceAccount upon creation.
## Default ServiceAccounts
- The `default` service accounts in each namespace get no permissions by default other than the default API discovery permissions that Kubernetes grants to all authenticated principals if role-based access control (RBAC) is enabled.
- If you delete the `default` ServiceAccount object in a namespace, the control plane replaces it with a new one.
- If you deploy a Pod in a namespace, and you don't manually assign a ServiceAccount to the Pod, Kubernetes assigns the `default` ServiceAccount for that namespace to the Pod.
## Use Cases for ServiceAccounts
- Your Pods need to communicate with the Kubernetes API server, for example, providing read-only access to sensitive information stored in Secrets.
- Your Pods need to communicate with an external service.
- An external service needs to communicate with the Kubernetes API server. For example, authenticating to the cluster as part of a CI/CD pipeline.
## Creating a ServiceAccount
1. Create a ServiceAccount object using a Kubernetes client like `kubectl` or a manifest that defines the object.
2. [[#Grant permissions to a ServiceAccount|Grant permissions]] to the ServiceAccount object using an authorization mechanism such as RBAC.
3. Assign the ServiceAccount object to Pods during Pod creation.
### Grant permissions to a ServiceAccount
You can use the built-in Kubernetes role-based access control ([[12) RBAC|RBAC]]) mechanism to grant the minimum permissions required by each service account, to follow the **principle of least privilege**.
1. You create a Role, which grants access.
2. Bind the Role to your ServiceAccount.
#### Example: Restricting access to Secrets
- Kubernetes provides an annotation called `kubernetes.io/enforce-mountable-secrets` that you can add to your ServiceAccounts.
- When this annotation is applied, the ServiceAccount's secrets can only be mounted on specified types of resources, enhancing the security posture of your cluster.
```yaml
apiVersion: v1
kind: ServiceAccount
metadata:
  annotations:
    kubernetes.io/enforce-mountable-secrets: "true"
  name: my-serviceaccount
  namespace: my-namespace
```