class Hashlog < ActiveRecord::Base
  attr_accessible :count, :latest, :tag


 def self.create_hashlog(hashtag)
  dash = "#"
  # @view_count_init = "0"
  @hashtag_scrubbed = [dash, hashtag].join
  		create!(
        tag: @hashtag_scrubbed,
        count: "0"
        )	
  end


end
