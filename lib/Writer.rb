require 'aws-sdk'
require './lib/message.rb'
require 'faker'

access_key = ENV['ACCESS_KEY_ID']
secret_access_key = ENV['SECRET_ACCESS_KEY']
@queue_name = "sample20140710"

AWS.config(
	:access_key_id => access_key,
	:secret_access_key => secret_access_key,
	:region => "ap-northeast-1")

def write
	sqs = AWS::SQS.new

	queue = sqs.queues.named(@queue_name)

	for i in 1..100
		msg = Message.new
		msg.id = Faker::Code.ean
		msg.name = Faker::Name.name
		msg.message = Faker::Lorem.sentence


		sent_msg = queue.send_message(msg.to_hash.to_json)

		#puts msg.message_id
		#puts msg.md5
	end

end

write