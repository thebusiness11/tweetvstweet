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


 	def self.create_hashlog(hashtag)
		dash = "#"
		# @view_count_init = "0"
		@hashtag_scrubbed = hashtag
		create!(
		tag: @hashtag_scrubbed,
		latest: Time.now.to_date,
		count: "0"
		)	
  	end

	def self.vote_history
		Hashlog.select("tag, min(created_at) as earliest").group("tag").order("earliest DESC").limit(19)
		# Hashlog.order('created_at DESC').limit(19)
	end
end
