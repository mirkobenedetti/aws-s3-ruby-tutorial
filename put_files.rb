require 'aws-sdk-s3'
require 'highline'


cli = HighLine.new
bucket_name = cli.ask "Please enter the name of your Bucket:"
file_name = cli.ask "Please enter the name of your file:"

profile_name = 'default'
region = 'us-west-2'

s3 = Aws::S3::Client.new(profile: profile_name, region: region)

file_handler = File.open(file_name, "r")

s3.put_object({
	  body: file_handler, 
	  bucket: bucket_name, 
	  key: file_name, 
})

file_handler.close
