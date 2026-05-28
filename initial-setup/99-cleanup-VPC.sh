# 99-cleanup-VPC.sh 

#2026-05-28 Steve Hager - Created.

# Configure the project context
PROJECT_ID="random-words-23478"
VPC_NAME="demonstration-vpc"
gcloud config set project $PROJECT_ID

# Delete firewall rules
gcloud compute firewall-rules delete demonstration-allow-internal -q
gcloud compute firewall-rules delete demonstration-allow-ssh-iap  -q

# Delete subnets
gcloud compute networks subnets delete demonstration-subnet-public  --region=us-central1 -q
gcloud compute networks subnets delete demonstration-subnet-private --region=us-central1 -q

# Delete the VPC network
gcloud compute networks delete $VPC_NAME -q