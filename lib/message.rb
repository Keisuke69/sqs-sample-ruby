class Message

	attr_accessor :id, :name, :message

	def to_hash
		hash = { 
			:id => @id,
			:name => @name,
			:message => @message}
	end
end