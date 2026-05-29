# 00c-grant-service-account-infra-mgr-role.sh
# 2026-05-28 Steve Hager - Created.

# Set the project ID variable 

PROJECT_ID="random-words-23478"
gcloud config set project $PROJECT_ID

gcloud projects add-iam-policy-binding $PROJECT_ID \
      --member="serviceAccount:demonstration-infra-mgr-sa@$PROJECT_ID.iam.gserviceaccount.com" \
      --role="roles/config.agent"

# Example Output
# Updated IAM policy for project [random-words-23478].
# bindings:
# ...
# - members:
#   - serviceAccount:demonstration-infra-mgr-sa@random-words-23478.iam.gserviceaccount.com
# ...
# etag: BwZS6ehmV2M=
# version: 1

gcloud projects add-iam-policy-binding $PROJECT_ID \
    --member="serviceAccount:demonstration-infra-mgr-sa@$PROJECT_ID.iam.gserviceaccount.com" \
    --role="roles/compute.instanceAdmin.v1"

# Example Output
#     Updated IAM policy for project [random-words-23478].
# bindings:
# ...
#   - serviceAccount:demonstration-infra-mgr-sa@random-words-23478.iam.gserviceaccount.com
#   role: roles/compute.instanceAdmin.v1
# ...
# etag: BwZS6f8RtO4=
# version: 1