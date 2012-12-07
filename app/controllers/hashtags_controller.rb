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
 		Hashtag.pull_hashtag(params[:hashtag])
		@random_hashtag_pull = Hashtag.random_hashtags_pull
		respond_to do |format|
		format.html { redirect_to vote_path }
		format.js
	end
	 end
end

  # 		dash = "#"
  # 		hashtag_scrubbed = [dash, params[:hashtag]].join
		# @random_hashtags = Hashtag.where{ |hashtag| hashtag.hashtag =~ hashtag_scrubbed}.order{"RANDOM()"}.limit(4)
	    # Hashtag.where{hashtag == "#espn"}.order{"RANDOM()"}.limit(3)
		# @view_update = 	Hashtag.update(274371071875108864, :view_count => "1")
		# Person.update(person_id, :user_name => 'New Name')
		# @fuck = params[:hashtag]
		# .where("hashtag LIKE ?", "%#{params[:hashtag]}%")
				# Hashtag.update_views
