# Require necessary libraries
require 'aws-sdk-s3'  # AWS SDK for interacting with S3
require 'pry'         # Pry for debugging (not used in script, but helpful)
require 'securerandom' # SecureRandom for generating unique content

# Get the S3 bucket name from environment variables
bucket_name = ENV['BUCKET_NAME']
# Define the AWS region (ensure this matches your S3 settings)
region = 'us-east-1'

# Initialize the S3 client with default AWS credentials
client = Aws::S3::Client.new(region: region)  # Ensure region is specified

if region == 'us-east-1'
  resp = client.create_bucket({ bucket: bucket_name })  # No location_constraint for us-east-1
else
  resp = client.create_bucket({
    bucket: bucket_name, 
    create_bucket_configuration: { location_constraint: region }
  })
end

# Generate a random number of files between 1 and 6
number_of_files = 1 + rand(6)
puts "number of files: #{number_of_files}"

# Iterate and create the specified number of files
number_of_files.times.each do |i|
  puts "i: #{i}"  # Print the current index
  
  filename = "file_#{i}.txt"  # Generate a unique filename
  output_path = "/tmp/#{filename}"  # Temporary file path

  # Create a local file and write a random UUID to it
  File.open(output_path, "w") do |f|
    f.write SecureRandom.uuid  # Generate and store a random string
  end

  # Open the file in binary mode and upload it to S3
  File.open(output_path, 'rb') do |f|
    client.put_object(  # Use `client.put_object`, not `s3.put_object`
      bucket: bucket_name, 
      key: filename,
      body: f
    )
  end
end