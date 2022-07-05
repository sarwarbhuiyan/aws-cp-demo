# Steps

1. Install terraform
2. open variables.tf and change to your VPC, security group, credentials file, etc. Note that if you change the region, your AMI will have to be changed to an AMI that exists there. 
To get a suitable Centos AMI, go to EC2 Launch Instance and search for AMI and press Launch. Copy the ami code (should be something like ami-121242343255) from the screen and copy it
to your variables.tf file in the ami variable
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
