## Step-Wise Process to Create VPC using S3 Backend Setup ##

### Step 1: Create S3 bucket and DynamoDB table by running terraform scripts in s3-dynamodb directory
    - terraform init
    - terraform plan
    - terraform apply

### Step 2: Once s3 bucket and dynamoDB table gets created, Run the Scripts in vpc directory, For s3 Backend Setup, Bucket and DynamoDB should be ready else backend configuration will fail. 
    - terraform init
    - terraform plan
    - terraform apply
