## Create a bucket

aws s3 mb s3://xanzhu-encryption-test-2 --region us-east-1

## Create a file

echo "Hello World" > hello.txt
aws s3 cp hello.txt s3://xanzhu-encryption-test-2/hello.txt

## Put Objects with Encryption (SS3-KMS)

aws s3api put-object \
--bucket xanzhu-encryption-test-2 \
--key hello.txt \
--body hello.txt \
--server-side-encryption "aws:kms" \
--ssekms-key-id "7ff43b13-7ec6-4348-b78e-84d33bb55edb"

## Download file
aws s3 cp s3://xanzhu-encryption-test-2/hello.txt hello.txt

## Put Object with SSE-C (Not working well)

Create SSL KEY (OPEN SSL)

export BASE64_ENCODED_KEY=$(openssl rand 32 | base64)
echo $BASE64_ENCODED_KEY

Generate MD5 SUM HASH:
export MD5_VALUE=$(echo -n $BASE64_ENCODED_KEY | base64 --decode | openssl dgst -md5 -binary | base64)
echo $MD5_VALUE


Could be put-bucket-encryption? 

aws s3api put-object \
--bucket xanzhu-encryption-test-2 \
--key hello.txt \
--body hello.txt \
--sse-customer-algorithm AES256 \
--sse-customer-key $BASE64_ENCODED_KEY \
--sse-customer-key-md5 $MD5_VALUE


## Uploade a file using sse-c key
openssl rand -out ssec.key 32

aws s3 cp hello.txt s3://xanzhu-encryption-test-2/hello.txt --sse-c "AES256" --sse-c-key fileb://ssec.key

Download without encryption (Fails to download)
aws s3 cp s3://xanzhu-encryption-test-2/hello.txt hello.txt

Download with encryption (Downloads as expected)
aws s3 cp s3://xanzhu-encryption-test-2/hello.txt hello.txt --sse-c "AES256" --sse-c-key fileb://ssec.key

## Cleanup

aws s3 rm s3://xanzhu-encryption-test-2/hello.txt
aws s3 rb s3://xanzhu-encryption-test-2

aws s3 rm s3://xanzhu-encryption-test/hello.txt
aws s3 rb s3://xanzhu-encryption-test