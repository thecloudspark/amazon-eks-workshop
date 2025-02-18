# Amazon EKS Workshop

## Provision the infrastructure

1. Make necessary adjustment on the variables.
2. Run `terraform init` to initialize the modules and other necessary resources.
3. Run `terraform plan` to check what will be created/deleted.
4. Run `terraform apply` to apply the changes. Type `yes` when asked to proceed.

## Fetch `kubeconfig` to access the cluster

```bash
export REGION=ap-southeast-1
export CLUSTER_NAME=eks-workshop
aws eks update-kubeconfig --region $REGION --name $CLUSTER_NAME
```

## Check what's inside the cluster

```bash
# List all pods in all namespaces
kubectl get pods -A

# List all deployments in kube-system
kubectl get deployment -n kube-system

# List all daemonsets in kube-system
kubectl get daemonset -n kube-system

# List all nodes
kubectl get nodes
```

## Let's try to deploy a simple app

```bash
# Create a deployment
kubectl create deployment my-app --image nginx

# Scale the replicas of my-app deployment
kubectl scale deployment/my-app --replicas 2

# Check the pods
kubectl get pods

# Delete the deployment
kubectl delete deployment my-app
```
