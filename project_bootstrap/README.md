# Terraform S3 Backend Bootstrapping template

This terraform manifest deploy the S3 bucket and DynamoDB table that you can use in another project to store the tfstate and lock state. 

>## [S3 Backend terraform documentation:](https://www.terraform.io/language/settings/backends/s3)
>
>Stores the state as a given key in a given bucket on Amazon S3. This backend also supports state locking and consistency checking via Dynamo DB, which can be enabled by setting the dynamodb_table field to an existing DynamoDB table name. A single DynamoDB table can be used to lock multiple remote state files. Terraform generates key names that include the values of the bucket and key variables.

## Resources deployed by this manifest:

- KMS Key (To encrypt the bucket)
- S3 Bucket
    - S3 versioning configuration
    - S3 Public Access Bloking
    - S3 Server Side Encryption
- DynamoDB Table:
    - Partition key named LockID with type of String

## Tested with: 

| Environment | Application | Version  |
| ----------------- |-----------|---------|
| WSL2 Ubuntu 20.04 | Terraform | v1.1.9  |

## Initialization How-To:
Located in the root directory, make an "aws configure" to log into the aws account, and a "terraform init" to download the necessary modules and start the backend.

```bash
aws configure
terraform init
```

## Deployment How-To:

Located in the root directory, make the necessary changes in the variables.tf file and run the manifests:

```bash
terraform apply
```

## S3 Backend - Example Configuration

After deploying the S3 bucket and DynamoDB table, you can use them in another terraform project as the S3 backend as follows:

```bash
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }

  backend "s3" {
    bucket         = "tfbootstrap-5242022"
    key            = "global/terraform.tfstate"
    dynamodb_table = "tfbootstrap-5242022"
    region         = "us-east-1"
    profile        = "default"
    encrypt        = true
  }
}
```

## Author:

- [@JManzur](https://jmanzur.com)

## Documentation:

- [Terraform Settings > Backends > S3](https://www.terraform.io/language/settings/backends/s3)
- [Amazon DynamoDB - Billing Mode Summary](https://docs.aws.amazon.com/amazondynamodb/latest/APIReference/API_BillingModeSummary.html)