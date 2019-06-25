require 'aws-sdk-s3'
require 'securerandom'
require 'highline'


profile_name = 'default'
region = 'us-west-2'

cli = HighLine.new
asked_name = cli.ask "Please enter a name for your Bucket:"


bucket_name = asked_name + '-' + SecureRandom.uuid

s3 = Aws::S3::Client.new(profile: profile_name, region: region)

begin
	s3.create_bucket(bucket: bucket_name)
	puts 'You created a new Bucket: ' + bucket_name
rescue Exception => e
	puts 'Something went wrong, please retry:'
	puts e.message
end

