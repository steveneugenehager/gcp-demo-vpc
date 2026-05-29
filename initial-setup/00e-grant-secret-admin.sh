# 00e-grant-secret-admin.sh
# 2026-05-28 Steve Hager - Created.

# Set the project ID variable 

PROJECT_ID="random-words-23478"
gcloud config set project $PROJECT_ID


PN=$(gcloud projects describe ${PROJECT_ID} --format="value(projectNumber)")
CLOUD_BUILD_SERVICE_AGENT="service-${PN}@gcp-sa-cloudbuild.iam.gserviceaccount.com"
gcloud projects add-iam-policy-binding ${PROJECT_ID} \
  --member="serviceAccount:${CLOUD_BUILD_SERVICE_AGENT}" \
  --role="roles/secretmanager.admin"
  
# Example Output
