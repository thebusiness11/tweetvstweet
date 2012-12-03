class HashtagsController < ApplicationController

 	def home 

	end

	def vote
		@random_hashtags = Hashtag.order("RANDOM()").limit(4)
	end

	def show
	

	end

	def index

	end

	def create
		@random_hashtags = Hashtag.order("RANDOM()").limit(4)
		Hashtag.pull_hashtag(params[:hashtag])
		respond_to do |format|
		format.html { redirect_to vote_path }
		format.js
	end
	 end
end