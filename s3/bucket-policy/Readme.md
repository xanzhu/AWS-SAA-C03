## Create Bucket

aws s3 mb s3://xanzhu-bucket-policy

## Create Bucket Policy

aws s3api put-bucket-policy --bucket xanzhu-bucket-policy --policy file://policy.json

(Policy Json missing the credentials for other account)

## Other account access bucket

touch bootcamp.txt
aws s3 cp bootcamp.txt s3://xanzhu-bucket-policy/bootcamp.txt
aws s3 ls s3://xanzhu-bucket-policy

# Clean up file and buckets 

aws s3 rm s3://xanzhu-bucket-policy/bootcamp.txt
aws s3 rb s3://xanzhu-bucket-policy