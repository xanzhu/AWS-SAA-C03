### Convert to JSON 

yq -o json policy.yml > policy.json (Requires installing yq) - Skipping

## Create policy

```sh
aws iam create-policy \
--policy-name my-fun-policy \
 --policy-document file://policy.json
 ```


## Create Policy Version

```sh
aws iam create-policy-version \
--policy-arn arn:aws:iam::713881790871:policy/my-fun-policy \
--set-as-default \
--policy-document file://policy.json
```

## Attach Policy

```sh
aws iam attach-user-policy \
--user-name aws-examples \
--policy-arn arn:aws:iam::713881790871:policy/my-fun-policy
```

## delete old policy versions

```sh
aws iam delete-policy-version \
--policy-arn arn:aws:iam::713881790871:policy/my-fun-policy \
--version-id v1
```

## delete policy

```sh
aws iam delete-policy \
--policy-arn arn:aws:iam::713881790871:policy/my-fun-policy
```