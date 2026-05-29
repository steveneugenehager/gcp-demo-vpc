# 00f-github-connection.sh - Create a connection to GitHub and create a repository in Cloud Build.
# 2026-05-28 Steve Hager - Created.

# Set the project ID variable 

PROJECT_ID="random-words-23478"
gcloud config set project $PROJECT_ID

gcloud builds connections create github demonstration_github_connect --region=us-central1
  
# Example Output


gcloud builds connections describe demonstration_github_connect --region=us-central1

gcloud builds repositories create demonstration_github_repo \
     --remote-uri=https://github.com/steveneugenehager/gcp-demo-vpc.git \
     --connection=demonstration_github_connect --region=us-central1


     