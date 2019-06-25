require 'aws-sdk-s3'
require 'highline'


cli = HighLine.new
bucket_name = cli.ask "Please enter the name of the Bucket to delete:"

profile_name = 'default'
region = 'us-west-2'

s3 = Aws::S3::Client.new(profile: profile_name, region: region)

objects = s3.list_objects({ bucket: bucket_name }).contents

objects.each do |object|
	s3.delete_object({
		bucket: bucket_name, 
		key: object.key
	})
end

s3.delete_bucket({ bucket: bucket_name })
