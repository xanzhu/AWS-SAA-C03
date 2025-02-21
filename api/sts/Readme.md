## Create user with no permissions

New user with no permissions and generate access keys

```sh
aws iam create-user --user-name sts-machine-user
aws iam create-access-key --user-name sts-machine-user --output table
```

Apply access keys to the user 
- aws configure

check identity
aws sts get-caller-identity

open credentials file and set to sts
cat ~/.aws/credentials

check profile matches the user
aws sts get-caller-identity --profile sts

ensure the user has no permissions
aws s3 ls --profile sts

create a deploy file and run it (Cloudformation connecting template.yaml)
chmod u+x bin/deploy
./bin/deploy

## Create a role  (CloudFormation)

Create role and resource that will access a new resource

## Use new credentials and assume role

```sh
aws iam put-user-policy \
  --user-name sts-machine-user \
  --policy-name StsAssumePolicy \
  --policy-document file://policy.json
```


```sh
aws sts assume-role \
    --role-arn arn:aws:iam::713881790871:role/my-sts-stack-StsRole-snCP3wsJtsu9 \
    --role-session-name xanzhu-sts \
    --profile sts
```

Edit credentials file and add the assumed profile copying in AccessKeyId and SecretAccessKey and session token!

Check assumed profile 
```sh
aws sts get-caller-identity --profile assumed
```

```sh
aws s3 ls --profile assumed
```

## Clean up 

- Tear down stack in cloud formation via AWS Management Console

Delete the user, access and policy !

1. Delete Policy
```sh
aws iam delete-user-policy --policy-name StsAssumePolicy --user-name sts-machine-user
```

2. Delete Access Key
```sh
aws iam delete-access-key --user-name sts-machine-user --access-key-id AKIA2MNVLVGLXB6VFXYR
```

2. Delete user 
```sh
aws iam delete-user --user-name sts-machine-user
```

