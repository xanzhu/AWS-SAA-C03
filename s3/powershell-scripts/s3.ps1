Import-Module AWS.Tools.S3

$region = "us-east-1"
$bucketName  = Read-Host -Prompt 'Enter the S3 bucket name'

Write-Host "S3 Bucket: $bucketName"
Write-Host "Region: $region"

# Check if bucket exists!
function BucketExists {
    $bucket = Get-S3Bucket -BucketName $bucketName -ErrorAction SilentlyContinue
    return $null -ne $bucket
}

if(-not (BucketExists)){
    Write-Host "Bucket does not exist"
    New-S3Bucket -BucketName $bucketName -Region $region
} else {
    Write-Host "Bucket Already Exists"
}


# Create a new file
$filename = "xanzhu.txt"
$fileContent = "Hello world"

# Setting the content
Set-Content -Path $fileName -Value $fileContent

Write-S3Object -BucketName $bucketName -File $filename -Key $fileName