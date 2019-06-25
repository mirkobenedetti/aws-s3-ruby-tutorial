require 'aws-sdk-s3'
require 'pp'


s3 = Aws::S3::Client.new(profile: 'default', region: 'us-west-2')

buckets = s3.list_buckets.buckets

puts 'You have no Buckets yet.' if buckets.empty?

buckets.each do |b|
	puts b.name
	objects = s3.list_objects({ bucket: b.name }).contents
	pp objects unless objects.empty?
end
