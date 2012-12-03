  Hashtag Load (0.7ms)  SELECT "hashtags".* FROM "hashtags" WHERE "hashtags"."hashtag" ILIKE '#tweetvstweet' LIMIT 12
  Hashtag Load (0.4ms)  SELECT "hashtags".* FROM "hashtags" WHERE "hashtags"."hashtag" ILIKE "hashtags"."hashtag" LIMIT 12
  Hashtag Load (0.5ms)  SELECT "hashtags".* FROM "hashtags" WHERE "hashtags"."hashtag" ILIKE 'hashtag' LIMIT 12






class HashtagsController < ApplicationController
 	
	def home 
		@hashtag = Hashtag.new(params[:hashtag])	
		@random_hashtags = Hashtag.order("RANDOM()").limit(4)
	end

	def create
    @hash_search = params[:hashtag]
	Twitter.search("@yahoo", :lang => "en", :count => 100, :result_type => "recent").results.map do |tweet|
  		Hashtag.create!(
  			tweet_id: tweet.id,
  			text: tweet.text,
  			profile_image_url: tweet.profile_image_url,
  			from_user: tweet.from_user,
  			created_at: tweet.created_at,
        	hashtag: @hash_search
        )	
  		end
        redirect_to root_url
	end
end



old ---using model
class HashtagsController < ApplicationController


 	
	def home 
		@hashtag = Hashtag.new(params[:hashtag])	
		@random_hashtags = Hashtag.order("RANDOM()").limit(4)
	end

	def create
		# @hashtag = Hashtag.new(params[:hashtag])	
		@search_field = params[:hashtag]
		Hashtag.pull_hashtag
		# if @hashtag.save
        redirect_to root_url
      # end

  end

end




code
, class: "span3 inverse", id:"appendedPrependedInput" 
