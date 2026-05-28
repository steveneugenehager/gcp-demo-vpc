# 04-validation.sh 
#2026-05-28 Steve Hager - Created.

# Configure the project context
PROJECT_ID="random-words-23478"
VPC_NAME="demonstration-vpc"
gcloud config set project $PROJECT_ID

#To see your new VPC:
gcloud compute networks list
#*****************
# Example output:
#-----------------
# NAME: default
# SUBNET_MODE: AUTO
# BGP_ROUTING_MODE: REGIONAL
# IPV4_RANGE: 
# GATEWAY_IPV4: 
# INTERNAL_IPV6_RANGE: 
#
# NAME: demonstration-vpc
# SUBNET_MODE: CUSTOM
# BGP_ROUTING_MODE: REGIONAL
# IPV4_RANGE: 
# GATEWAY_IPV4: 
# INTERNAL_IPV6_RANGE: 

#To see your subnets:
gcloud compute networks subnets list --network=$VPC_NAME

#*****************
# Example output:
#-----------------
# NAME: demonstration-subnet-private
# REGION: us-central1
# NETWORK: demonstration-vpc
# RANGE: 10.0.2.0/24
# STACK_TYPE: IPV4_ONLY
# IPV6_ACCESS_TYPE: 
# INTERNAL_IPV6_PREFIX: 
# EXTERNAL_IPV6_PREFIX: 
# UTILIZATION_DETAILS: 
#
# NAME: demonstration-subnet-public
# REGION: us-central1
# NETWORK: demonstration-vpc
# RANGE: 10.0.1.0/24
# STACK_TYPE: IPV4_ONLY
# IPV6_ACCESS_TYPE: 
# INTERNAL_IPV6_PREFIX: 
# EXTERNAL_IPV6_PREFIX: 
# UTILIZATION_DETAILS: 

# To check your firewall configurations:
gcloud compute firewall-rules list --filter="network:$VPC_NAME"
#*****************
# Example output:
#-----------------
# NAME: demonstration-allow-internal
# NETWORK: demonstration-vpc
# DIRECTION: INGRESS
# PRIORITY: 1000
# ALLOW: tcp:0-65535,udp:0-65535,icmp
# DENY: 
# DISABLED: False
#
# NAME: demonstration-allow-ssh-iap
# NETWORK: demonstration-vpc
# DIRECTION: INGRESS
# PRIORITY: 1000
# ALLOW: tcp:22
# DENY: 
# DISABLED: False