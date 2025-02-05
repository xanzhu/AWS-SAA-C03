# Create bucket

```sh
aws s3 mb: s3://prefixes-xanzhu-22
```

# Create empty folder prefix 

```sh
aws s3api put-object --bucket prefixes-xanzhu-22 --key "test/"
```

# Show prefixed folders in AWS
```sh
aws s3 ls s3://prefixes-xanzhu-22 

aws s3api list-objects --bucket prefixes-xanzhu-22
```

