## Create a new S3 bucket

```md
aws s3 mb s3://checksums-examples-xanzhu-2342
```


## Create file for checksum

```
echo "Hello Mars" > myfile.txt
```

## Get checksum of a file (MD5)
```
md5sum myfile.txt
```

Checksum: 8ed2d86f12620cdba4c976ff6651637f  myfile.txt

## Upload file to S3 (Using Copy)

```
aws s3 cp myfile.txt s3://checksums-examples-xanzhu-2342
```

## Return file checksum / etag
```
aws s3api head-object --bucket checksums-examples-xanzhu-2342 --key myfile.txt
```

## Upload file with different checksum

Checksum creation
```sh
sudo apt install rhash -y
rhash --crc32 --simple myfile.txt
```

Value for AWS
```sh
aws s3api put-object --bucket checksums-examples-xanzhu-2342 --key myfileCRC32.txt --body myfile.txt
--checksum-algorithm="CRC32"
--checksum-crc32="e7c80b87"
```

```md
aws s3 cp myfile.txt s3://checksums-examples-xanzhu-2342 --checksum-algorithm="CRC32"
```