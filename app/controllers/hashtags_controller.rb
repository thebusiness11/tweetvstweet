class HashtagsController < ApplicationController

	def cast_vote
	@vote_history = Hashlog.vote_history
	@leaderboard = Hashtag.leaderboard_history_current
 	Hashtag.cast_vote(params[:cast_vote])
 		@cast_vote_hashtag = Hashtag.cast_vote_hashtag(params[:hashtag])
 		respond_to do |format|
 		format.html { redirect_to root_path }
 		format.js
		end
	end	

	def show
	

	end

def home	
			@vote_history = Hashlog.vote_history
			@leaderboard = Hashtag.leaderboard_history

end
	
	def create 
			@stats_total = Hashtag.count 
	@stats_wins = Hashtag.sum(:wins)
	@stats_views = Hashtag.sum(:view_count)

	@stats_losers = (@stats_views - @stats_wins) 
		@vote_history = Hashlog.vote_history
		if signed_in?
 			Hashtag.create_hashtag_signed_in(params[:hashtag])
 		else
 			Hashtag.create_hashtag_guest(params[:hashtag])
 		end
 		Hashlog.create_hashlog(params[:hashtag])
		@random_hashtag_pull = Hashtag.random_hashtags_pull
		@leaderboard = Hashtag.leaderboard_history_current
		respond_to do |format|
		format.html { redirect_to root_path }
		format.js
	end
	 end
end
