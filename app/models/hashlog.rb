# == Schema Information
#
# Table name: hashlogs
#
#  id         :integer          not null, primary key
#  tag        :string(255)
#  count      :integer
#  latest     :date
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Hashlog < ActiveRecord::Base
  attr_accessible :count, :latest, :tag, :created_at


 	def self.create_hashlog(hashtag)		#enters hashtag into the log table, without #. 
		@hashtag_scrubbed = hashtag.downcase
		# Hashlog.find_or_create_by_tag(@hashtag_scrubbed) 

		taglog = Hashlog.find_or_initialize_by_tag(@hashtag_scrubbed) do |t|
    	t.count = 0
  		end
  		taglog.count += 1
  		taglog.save!	
	end


	def self.vote_history					#displays the latest searches on the left
		# Hashlog.select("tag, min(created_at) as earliest").group("tag").order("earliest DESC").limit(19)
		Hashlog.order('updated_at DESC').limit(19)
	end
end
