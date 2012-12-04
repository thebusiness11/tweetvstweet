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
		# @fuck = params[:hashtag]
		# .where("hashtag LIKE ?", "%#{params[:hashtag]}%")
  		dash = "#"
  		hashtag_scrubbed = [dash, params[:hashtag]].join
		@random_hashtags = Hashtag.where{ |hashtag| hashtag.hashtag =~ hashtag_scrubbed}.order{"RANDOM()"}.limit(4)
		 # Hashtag.where{hashtag == "#espn"}.order{"RANDOM()"}.limit(3)

		Hashtag.pull_hashtag(params[:hashtag])
		respond_to do |format|
		format.html { redirect_to vote_path }
		format.js
	end
	 end
end