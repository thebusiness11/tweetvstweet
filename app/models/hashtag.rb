# == Schema Information
#
# Table name: hashtags
#
#  id                :integer          not null, primary key
#  tweet_id          :integer
#  from_user         :string(255)
#  text              :text
#  profile_image_url :text
#  from_user_name    :string(255)
#  created_at        :date             not null
#  hashtag           :string(255)
#  updated_at        :datetime         not null
#  view_count        :integer
#  wins              :integer
#

class Hashtag < ActiveRecord::Base

  attr_accessible :text, :profile_image_url, :from_user, :created_at, :tweet_id, :hashtag, :from_user_name, :view_count, :wins

 
  def self.create_hashtag_signed_in(hashtag)            #creates new tweetvstweet for inputed hashtag with # for logged in users
    dash = "#"
    @hashtag_scrubbed = [dash, hashtag].join
    User.current_user.twitter.search("%#{@hashtag_scrubbed}", :lang => "en", :count => 100, :result_type => "mixed").results.map do |tweet|
  	unless exists?(tweet_id: tweet.id)
  		create!(
  			tweet_id: tweet.id,
  			text: tweet.text,
  			profile_image_url: tweet.user.profile_image_url,
  			from_user: tweet.from_user,
        from_user_name: tweet.user.name, 
  			created_at: tweet.created_at,
        hashtag: @hashtag_scrubbed,
        view_count: "0",
        wins: "0"
          )	
  		end		
  	end
  end

  def self.create_hashtag_guest(hashtag)                #creates new tweetvstweet for inputed hashtag with # for guests
  dash = "#"
  @hashtag_scrubbed = [dash, hashtag].join.downcase
  Twitter.search("%#{@hashtag_scrubbed}", :lang => "en", :count => 100, :result_type => "mixed").results.map do |tweet|
    unless exists?(tweet_id: tweet.id)
      create!(
        tweet_id: tweet.id,
        text: tweet.text,
        profile_image_url: tweet.user.profile_image_url,
        from_user: tweet.from_user,
        from_user_name: tweet.user.name, 
        created_at: tweet.created_at,
        hashtag: @hashtag_scrubbed,
        view_count: "0",
        wins: "0"
          ) 
      end   
    end
  end


  def self.random_hashtags_pull                         #pulls 4 random hashtags for a vote first display
    Hashtag.where{ |hashtag| hashtag.hashtag =~ @hashtag_scrubbed}.order{"RANDOM()"}.limit(4).each(&:update_view_count)
  end

  def self.cast_vote_hashtag(hashtag)                    #pulls 4 random hashtags for a vote continued votes
    Hashtag.where{ |hashtag| hashtag.hashtag =~ @hashtag_scrubbed}.order{"RANDOM()"}.limit(4).each(&:update_view_count)
  end

  def self.leaderboard_history_current                  #displaying 5 highscore hashtags on the right
    Hashtag.where{ |hashtag| hashtag.hashtag =~ @hashtag_scrubbed}.order{"wins DESC"}.limit(5)  
  end

  def update_view_count                                  #updates the number of views
    Hashtag.increment_counter(:view_count, self.id)
    self.view_count += 1 
  end

  def self.cast_vote(cast_vote)                           #counts number of wins
    Hashtag.increment_counter(:wins, cast_vote)
  end

  def self.leaderboard_history                            #right side leaderboard history
    Hashtag.order('wins DESC').limit(5)
  end
end



