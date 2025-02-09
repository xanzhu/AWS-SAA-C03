## Create a bucket 

aws s3 mb s3://xanzhu-class-25

## Create a file

echo "hello world" > hello.txt

## Upload the file to the bucket

aws s3 cp hello.txt s3://xanzhu-class-25

## Adjust standard storage class to Infrequent Access (Standard_IA)

aws s3 cp hello.txt s3://xanzhu-class-25 --storage-class STANDARD_IA

## Cleanup 

aws s3 rm s3://xanzhu-class-25/hello.txt

aws s3 rb s3://xanzhu-class-25