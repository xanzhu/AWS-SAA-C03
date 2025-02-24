# Get VPC ID

```sh
aws ec2 describe-vpcs --filters "Name=tag:Name,Values=nacl-example-vpc" --query "Vpcs[0].VpcId" --output text

echo 
```

# Create NACL

```sh
aws ec2 create-network-acl --vpc-id vpc-09d70f33c4f1b6b98
```

# Block access to ip

```sh
aws ec2 create-network-acl-entry --network-acl-id acl-008472f5c48733378 --ingress --rule-number 90 --protocol "-1" --cidr-block "203.211.106.118/32" --port-range From=0,To=65535 --rule-action "deny"
```

# Find AMI ID

```sh
aws ec2 describe-images --owners amazon --filters "Name=name,Values=amzn2-ami-hvm-*-x86_64-gp2" --region ap-southeast-2 --query "Images | sort_by(@, &CreationDate) [-1].ImageId" --output text
```