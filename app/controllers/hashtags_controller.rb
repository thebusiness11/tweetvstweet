class HashtagsController < ApplicationController

 	def home 

	end

	def cast_vote
 	Hashtag.cast_vote(params[:cast_vote])
 		@cast_vote_hashtag = Hashtag.cast_vote_hashtag(params[:hashtag])
 		respond_to do |format|
 		format.html { redirect_to root_path }
 		format.js
		end
	end	

	def show
	

	end

	def index

	end

	def create 
 		if signed_in?
 			Hashtag.create_hashtag_signed_in(params[:hashtag])
 		else
 			Hashtag.create_hashtag_guest(params[:hashtag])
 		end
 		Hashlog.create_hashlog(params[:hashtag])
		@random_hashtag_pull = Hashtag.random_hashtags_pull
		respond_to do |format|
		format.html { redirect_to root_path }
		format.js
	end
	 end

end
