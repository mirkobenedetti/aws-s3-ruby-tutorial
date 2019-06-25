require 'aws-sdk-s3'
require 'highline'


cli = HighLine.new
bucket_name = cli.ask "Please enter the name of your Bucket:"
file_name = cli.ask "Please enter the name of your file:"

profile_name = 'default'
region = 'us-west-2'

s3 = Aws::S3::Client.new(profile: profile_name, region: region)

s3.delete_object({
	bucket: bucket_name,
	key: file_name
})
