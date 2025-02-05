# Create a bucket

aws s3 mb s3://metadata-xanzhu-25

### Create new file

echo "Hello World" > hello.txt

## Upload file with metadata

aws s3api put-object --bucket metadata-xanzhu-25 --key hello.txt --body hello.txt --metadata Planet=Mars


### View object metadata in CLI

aws s3api head-object --bucket metadata-xanzhu-25 --key hello.txt

## Delete files inside bucket

aws s3 rm s3://metadata-xanzhu-25/hello.txt

## Delete bucket 

aws s3 rb s3://metadata-xanzhu-25