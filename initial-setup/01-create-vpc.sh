# 01-create-vpc.sh 
#2026-05-28 Steve Hager - Created.

# Building a demonstration VPC using the gcloud CLI is a great way to understand Google Cloud’s 
# networking fundamentals. To do this right, we will use Custom mode instead of Auto mode. This 
# gives you full control over your IP ranges and regions, which is standard best practice for 
# data and cloud engineering.

# Create the network container itself. By spinning it up with --subnet-mode=custom, GCP won't 
# automatically populate it with subnets in every global region.

# Configure the project context
PROJECT_ID="random-words-23478"
gcloud config set project $PROJECT_ID

gcloud compute networks create demonstration-vpc \
    --subnet-mode=custom \
    --bgp-routing-mode=regional \
    --description="Demonstration VPC network"

#*****************
# Example output:
#-----------------
# Operation "operations/acf.p2-617755953434-7c898a7b-abd5-4255-9ffe-f65557266da4" finished successfully.
# Created [https://www.googleapis.com/compute/v1/projects/random-words-23478/global/networks/demonstration-vpc].
# NAME: demonstration-vpc
# SUBNET_MODE: CUSTOM
# BGP_ROUTING_MODE: REGIONAL
# IPV4_RANGE: 
# GATEWAY_IPV4: 
# INTERNAL_IPV6_RANGE: 
#
# Instances on this network will not be reachable until firewall rules
# are created. As an example, you can allow all internal traffic between
# instances as well as SSH, RDP, and ICMP by running:
#
# $ gcloud compute firewall-rules create <FIREWALL_NAME> --network demonstration-vpc --allow tcp,udp,icmp --source-ranges <IP_RANGE>
# $ gcloud compute firewall-rules create <FIREWALL_NAME> --network demonstration-vpc --allow tcp:22,tcp:3389,icmp