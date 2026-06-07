# infra-live
- set env
```bash
export ALICLOUD_ACCESS_KEY=""
export ALICLOUD_SECRET_KEY=""

export AWS_ACCESS_KEY_ID=""
export AWS_SECRET_ACCESS_KEY=""
```

- Create s3 bucket

- Create a foundation network
```bash
cd foundation/aws/network/${env}/
```

- Create terraform.tfvars and set parameters
</br>

- Execute command
```bash
terraform init
terraform plan
terraform apply or terraform apply -auto-apporve
```
