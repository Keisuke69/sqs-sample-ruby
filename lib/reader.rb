require 'aws-sdk'

access_key = ENV['ACCESS_KEY_ID']
secret_access_key = ENV['SECRET_ACCESS_KEY']

AWS.config(
	:access_key_id => access_key,
	:secret_access_key => secret_access_key)

def get
	sqs = AWS::SQS.new
	queues = sqs.queues

	queues.each {|queue|
		p queue.name
	}

end

get