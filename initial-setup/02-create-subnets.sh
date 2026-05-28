# 02-create-subnets.sh 
#2026-05-28 Steve Hager - Created.

# Configure the project context
PROJECT_ID="random-words-23478"
REGION_ID="us-central1"
VPC_NAME="demonstration-vpc"
gcloud config set project $PROJECT_ID

#Public Subnet (For resources facing or accessing the internet)
gcloud compute networks subnets create demonstration-subnet-public \
    --network=$VPC_NAME \
    --region=$REGION_ID \
    --range=10.0.1.0/24

#*****************
# Example output:
#-----------------
# Created [https://www.googleapis.com/compute/v1/projects/random-words-23478/regions/us-central1/subnetworks/demonstration-subnet-public].
# NAME: demonstration-subnet-public
# REGION: us-central1
# NETWORK: demonstration-vpc
# RANGE: 10.0.1.0/24
# STACK_TYPE: IPV4_ONLY
# IPV6_ACCESS_TYPE: 
# INTERNAL_IPV6_PREFIX: 
# EXTERNAL_IPV6_PREFIX: 

#Private Subnet (For secure backends, databases, or data pipelines)
#We will enable Private Google Access (--enable-private-ip-google-access) on this one. 
#This allows resources in this subnet to interact with GCP APIs and services (like 
#Cloud Storage or BigQuery) without needing a public IP address.
gcloud compute networks subnets create demonstration-subnet-private \
    --network=$VPC_NAME \
    --region=$REGION_ID \
    --range=10.0.2.0/24 \
    --enable-private-ip-google-access

#*****************
# Example output:
#-----------------
# Created [https://www.googleapis.com/compute/v1/projects/random-words-23478/regions/us-central1/subnetworks/demonstration-subnet-private].
# NAME: demonstration-subnet-private
# REGION: us-central1
# NETWORK: demonstration-vpc
# RANGE: 10.0.2.0/24
# STACK_TYPE: IPV4_ONLY
# IPV6_ACCESS_TYPE: 
# INTERNAL_IPV6_PREFIX: 
# EXTERNAL_IPV6_PREFIX: 