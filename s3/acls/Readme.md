## Create a bucket

Note: Doesn't seem to like using ap-southeast-2 only the default region..

aws s3api create-bucket --bucket xanzhu-bucket-10 --region us-east-1

## Turn off block public access for ACLS

aws s3api put-public-access-block --bucket xanzhu-bucket-10 --public-access-block-configuration BlockPublicAcls=false,IgnorePublicAcls=true,BlockPublicPolicy=true,RestrictPublicBuckets=true

## Check bucket policy

aws s3api get-public-access-block --bucket xanzhu-bucket-10

## Change bucket ownership
- Enables the usage of ACLS on buckets! 

aws s3api put-bucket-ownership-controls --bucket xanzhu-bucket-10 --ownership-controls="Rules=[{ObjectOwnership=BucketOwnerPreferred}]"

## Allow another AWS account to access the bucket (Untested need secondary account)

aws s3api put-bucket-acl --bucket xanzhu-bucket-10 --grant-full-control email=xanzhu@amazon.com -grant-read uri=http://acs.amazonaws.com/groups/global/AllUsers

## Additional Config settings (Untested)
- Change ACL for another use using policy.json file


## Cleanup (Delete bucket)

aws s3api delete-bucket --bucket xanzhu-bucket-10

or 

aws s3 rb s3://xanzhu-bucket-10