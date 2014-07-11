require 'aws-sdk'

access_key = ENV['ACCESS_KEY_ID']
secret_access_key = ENV['SECRET_ACCESS_KEY']
@queue_name = "sample20140710"

AWS.config(
	:access_key_id => access_key,
	:secret_access_key => secret_access_key,
	:region => "ap-northeast-1")

def get
	sqs = AWS::SQS.new

	# queues = sqs.queues
	# queues.each {|queue|
	# 	puts queue.url
	# }

	queue = sqs.queues.named(@queue_name)
	queue.poll do |msg|
		puts msg.body
	end

end

def get_once
	sqs = AWS::SQS.new

	queue = sqs.queues.named(@queue_name)
	msg = queue.receive_message
	puts msg.body
	puts msg.handle
	puts msg.id
	puts msg.queue.url
	puts msg.md5

end

get