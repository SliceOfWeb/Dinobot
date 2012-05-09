namespace :dinobot do
	desc "Clean unused conversations from db"
	task :clean_conversations => :environment do
		Conversation.all.each do |c|
			c.conversation_statuses.each do |cs|
				if cs.visibility == true
					break
				else
					cs.destroy
				end
			end
		end

		conv_counter = 0
		Conversation.all.each do |c| 
			if c.conversation_statuses == [] 
				c.destroy 
				conv_counter += 1
			end
		end

		puts "#{conv_counter} conversations cleaned"

	end	
end

