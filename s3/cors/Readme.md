# Create Website 1
## Create Bucket

```sh
aws s3 mb s3://xanzhu-cors-bucket
```

## Change block public access

```sh
aws s3api put-public-access-block \
    --bucket xanzhu-cors-bucket \
    --public-access-block-configuration "BlockPublicAcls=true,IgnorePublicAcls=true,BlockPublicPolicy=false,RestrictPublicBuckets=false"
```

## Create Bucket Policy 

```sh
aws s3api put-bucket-policy --bucket xanzhu-cors-bucket --policy file://bucket-policy.json
```

## Turn on static website hosting 

```sh
aws s3api put-bucket-website --bucket xanzhu-cors-bucket --website-configuration file://website.json
```

## Upload index.html file (Resource with cross origin)

```sh
aws s3 cp index.html s3://xanzhu-cors-bucket
```

## View website and see if the index.html is there.

```sh
http://xanzhu-cors-bucket.s3-website-ap-southeast-2.amazonaws.com
```

```sh  
aws s3api get-bucket-website --bucket xanzhu-cors-bucket
```

(After each change re-upload file)


---------

# Create Website 2

## Create Bucket

```sh
aws s3 mb s3://xanzhu-cors-bucket-2
```

## Change block public access

```sh
aws s3api put-public-access-block \
    --bucket xanzhu-cors-bucket-2 \
    --public-access-block-configuration "BlockPublicAcls=true,IgnorePublicAcls=true,BlockPublicPolicy=false,RestrictPublicBuckets=false"
```

## Create Bucket Policy 

```sh
aws s3api put-bucket-policy --bucket xanzhu-cors-bucket-2 --policy file://bucket-policy2.json
```

## Turn on static website hosting 

```sh
aws s3api put-bucket-website --bucket xanzhu-cors-bucket-2 --website-configuration file://website.json
```

## Upload index.html file (Resource with cross origin)

```sh
aws s3 cp index.html s3://xanzhu-cors-bucket-2
```

## Turn on Static hosting 

```sh
aws s3api put-bucket-website --bucket xanzhu-cors-bucket-2 --website-configuration file://website.json
```

## Upload javascript file (Resource with cross origin)

```sh
aws s3 cp hello.js s3://xanzhu-cors-bucket-2
```

## Create api gateway with mock response testing endpoint: 

https://5lm4tl3lia.execute-api.us-east-1.amazonaws.com/prod

curl -X POST -H "Content-Type: application/json" https://5lm4tl3lia.execute-api.us-east-1.amazonaws.com/prod/hello


## Set CORS on bucket

aws s3api put-bucket-cors --bucket xanzhu-cors-bucket --cors-configuration file://cors.json