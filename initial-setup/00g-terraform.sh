# 00f-github-connection.sh - Create a connection to GitHub and create a repository in Cloud Build.
# 2026-05-28 Steve Hager - Created.

# Set the project ID variable 

PROJECT_ID="random-words-23478"
gcloud config set project $PROJECT_ID

gcloud infra-manager deployments apply projects/${PROJECT_ID}/locations/us-central1/deployments/zookeeper-deployment \
        --service-account projects/${PROJECT_ID}/serviceAccounts/demonstration-infra-mgr-sa@$PROJECT_ID.iam.gserviceaccount.com \
        --git-source-repo="https://github.com/steveneugenehager/gcp-demo-vpc.git" \
        --git-source-directory="zookeeper-ensemble/terraform" \
        --provider-source=SERVICE_MAINTAINED

        # Example Output

        