# 03-configure-firewall-rules.sh 
#2026-05-28 Steve Hager - Created.

# Configure the project context
PROJECT_ID="random-words-23478"
VPC_NAME="demonstration-vpc"
gcloud config set project $PROJECT_ID

#By default, all incoming traffic to a new VPC is blocked. You need to create firewall 
#rules to allow legitimate traffic.

# 1 - Allow Internal VPC Traffic
#       This rule allows resources within your VPC to communicate freely across subnets.

gcloud compute firewall-rules create demonstration-allow-internal \
    --network=$VPC_NAME \
    --allow=tcp:0-65535,udp:0-65535,icmp \
    --source-ranges=10.0.0.0/16

#*****************
# Example output:
#-----------------
# Creating firewall...working..Created [https://www.googleapis.com/compute/v1/projects/random-words-23478/global/firewalls/demonstration-allow-internal].                                                                                          
# Creating firewall...done.                                                                                                                                                                                                                        
# NAME: demonstration-allow-internal
# NETWORK: demonstration-vpc
# DIRECTION: INGRESS
# PRIORITY: 1000
# ALLOW: tcp:0-65535,udp:0-65535,icmp
# DENY: 
# DISABLED: False

# 2 -Allow SSH Access (via IAP)
# Instead of opening port 22 to the entire internet, it’s best practice to use 
# Identity-Aware Proxy (IAP) for secure SSH access. Google’s IAP proxies traffic 
# from a specific IP range: 35.235.240.0/20.

gcloud compute firewall-rules create demonstration-allow-ssh-iap \
    --network=$VPC_NAME \
    --allow=tcp:22 \
    --source-ranges=35.235.240.0/20 \
    --target-tags=allow-ssh
#*****************
# Example output:
#-----------------
# Creating firewall...working..Created [https://www.googleapis.com/compute/v1/projects/random-words-23478/global/firewalls/demonstration-allow-ssh-iap].                                                                                           
# Creating firewall...done.                                                                                                                                                                                                                        
# NAME: demonstration-allow-ssh-iap
# NETWORK: demonstration-vpc
# DIRECTION: INGRESS
# PRIORITY: 1000
# ALLOW: tcp:22
# DENY: 
# DISABLED: False