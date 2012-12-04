class Hashtag < ActiveRecord::Base

  attr_accessible :text, :profile_image_url, :from_user, :created_at, :tweet_id, :hashtag, :from_user_name


 def self.pull_hashtag(hashtag)
  dash = "#"
  hashtag_scrubbed = [dash, hashtag].join
  Twitter.search("%#{hashtag_scrubbed}", :lang => "en", :count => 100, :result_type => "mixed").results.map do |tweet|
  	unless exists?(tweet_id: tweet.id)
  		create!(
  			tweet_id: tweet.id,
  			text: tweet.text,
  			profile_image_url: tweet.user.profile_image_url,
  			from_user: tweet.from_user,
        from_user_name: tweet.user.name, 
  			created_at: tweet.created_at,
        hashtag: hashtag_scrubbed
        )	
  		end		
  	end
  end
end



