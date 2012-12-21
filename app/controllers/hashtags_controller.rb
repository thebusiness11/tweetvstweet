class HashtagsController < ApplicationController

	before_filter :stats

	def home	
		@leaderboard = Hashtag.leaderboard_history
		@trends_display = Trend.trends_display
		@hash_create = Hashtag.new
		
	end


	def create 
		@hash_create = Hashtag.create_hashtag(params[:hashtag])
		Hashlog.create_hashlog(params[:hashtag])
		@random_hashtag_pull = Hashtag.random_hashtags_pull
		@leaderboard = Hashtag.leaderboard_history_current
		respond_to do |format|
			format.html { redirect_to root_path }
			format.js 
		end
	end

	def cast_vote  											#Voting in the middle of the page
	 	Hashtag.cast_vote(params[:cast_vote])					#Tells which hashtag to vote for
		@leaderboard = Hashtag.leaderboard_history_current 		#updates the leaderboard on the right
 		@cast_vote_hashtag = Hashtag.cast_vote_hashtag(params[:hashtag])
 		respond_to do |format|
	 		format.html { redirect_to root_path }
	 		format.js
		end
	end	

	private
	  def stats
			@stats_total = Hashtag.count 
			@stats_wins = Hashtag.sum(:wins)
			@stats_views = Hashtag.sum(:view_count)
			@stats_losers = (@stats_views - @stats_wins) 
			@vote_history = Hashlog.vote_history
		end

end
