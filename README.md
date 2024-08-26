# User Service Infrastructure

This repository contains the Terraform scripts and Kubernetes YAML files needed to deploy the User Service on Google Cloud Platform (GCP) in the Southeast Asia (Singapore) region.


## Prerequisites

- Google Cloud SDK installed and configured.
- Terraform installed on your local machine.
- Docker installed to build and push the Docker image.

## Setup and Deployment

### 1. Configure Terraform

Navigate to the `terraform/` directory and initialize Terraform:

```bash
cd terraform/
terraform init
```

```bash
terraform plan
```

```bash
terraform apply
```
### 2. Build and Push Docker Image
After the infrastructure is set up, build your Docker image for the User Service and push it to the Google Container Registry:

### 3. Deploy User Service to GKE
Navigate to the k8s/ directory and apply the Kubernetes YAML files to deploy the User Service:

```bash
cd ../k8s/
kubectl apply -f user-service-deployment.yaml
kubectl apply -f user-service-service.yaml
```

### 4. Validate the Deployment
Check the status of the pods and services to ensure that the deployment is successful:

```bash
kubectl get pods
kubectl get services
```
Access the User Service via the external IP provided by the LoadBalancer service.

## Clean Up
To avoid unnecessary costs, you can destroy the infrastructure when it's no longer needed:

```bash
cd terraform/
terraform destroy
```

## Notes
Ensure that the your-gcp-project-id placeholder is replaced with your actual GCP project ID.
Adjust the number of replicas or machine types in the main.tf file based on your requirements.





