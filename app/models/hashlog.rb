class Hashlog < ActiveRecord::Base
  attr_accessible :count, :latest, :tag, :created_at


 	def self.create_hashlog(hashtag)
		dash = "#"
		# @view_count_init = "0"
		@hashtag_scrubbed = [dash, hashtag].join
		create!(
		tag: @hashtag_scrubbed,
		count: "0"
		)	
  	end

	def self.vote_history
		 Hashlog.order('created_at DESC').limit(19)
	end
end