## Create bucket 

aws s3 mb s3://xanzhu-encrypt-client

## Create a file 

echo "Hello World" > hello.txt
aws s3 cp hello.txt s3://xanzhu-encrypt-client/hello.txt

Example uses RUBY SDK to create this not really needed. 