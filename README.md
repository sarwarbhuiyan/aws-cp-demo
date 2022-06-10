# Steps

1. Install terraform
2. open variables.tf and change to your VPC, security group, credentials file, etc.
3. Ensure your AWS API key and secret are stored in ~/.aws/credentials
4. Run (and make a note of the URL printed in the output. That will be the URL you'd use for Control Center with the port set to 9021):

```
> terraform init && terraform apply
```
5. Login to the AWS machine 
6. Run:
```
> cd cp-demo && ./scripts/start.sh
```


Once you're done with the machine:
Run
```
terraform destroy
```
