class Hashtag < ActiveRecord::Base

  attr_accessible :text, :profile_image_url, :from_user, :created_at, :tweet_id, :hashtag

 def self.pull_hashtag(hashtag)
  @hash_search ||= hashtag
  Twitter.search("%#{@hash_search}", :lang => "en", :count => 40, :result_type => "mixed").results.map do |tweet|
  	unless exists?(tweet_id: tweet.id)
  		create!(
  			tweet_id: tweet.id,
  			text: tweet.text,
  			profile_image_url: tweet.user.profile_image_url,
  			from_user: tweet.from_user,
  			created_at: tweet.created_at,
        hashtag: @hash_search
        )	
  		end		
  	end
  end
end


