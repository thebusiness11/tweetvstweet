class HashtagsController < ApplicationController

 	def home 
		@random_hashtags = Hashtag.order("RANDOM()").limit(4)
	end

	def create
		Hashtag.pull_hashtag(params[:hashtag])
        redirect_to root_url
	 end
end