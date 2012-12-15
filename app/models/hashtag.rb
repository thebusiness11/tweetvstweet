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
  
  hashtag_regex = /[A-Za-z][A-Za-z0-9]*(?:_[A-Za-z0-9]+)*$/i 
 
  validates :hashtag,  :presence => true,
                    :length   => { :within => 3..20 },
                    :format   => { :with => hashtag_regex }
  

 class << self

def create_hashtag(hashtag)                #creates new tweetvstweet for inputed hashtag with # for guests
    dash = "#"
    @hashtag_scrubbed = [dash, hashtag].join.downcase
    (User.current_user ? User.current_user.twitter : Twitter).search("%#{@hashtag_scrubbed}", :lang => "en", :count => 100, :result_type => "mixed").results.map do |tweet|
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
 


  def random_hashtags_pull                         #pulls 4 random hashtags for a vote first display
    Hashtag.where{ |hashtag| hashtag.hashtag =~ @hashtag_scrubbed}.order{"RANDOM()"}.limit(4).each(&:update_view_count)
  end

  def cast_vote_hashtag(hashtag)                    #pulls 4 random hashtags for a vote continued votes
    Hashtag.where{ |hashtag| hashtag.hashtag =~ @hashtag_scrubbed}.order{"RANDOM()"}.limit(4).each(&:update_view_count)
  end

  def leaderboard_history_current                  #displaying 5 highscore hashtags on the right
    Hashtag.where{ |hashtag| hashtag.hashtag =~ @hashtag_scrubbed}.order{"wins DESC"}.limit(5)  
  end

  def cast_vote(cast_vote)                           #counts number of wins
    Hashtag.increment_counter(:wins, cast_vote)
  end

  def leaderboard_history                            #right side leaderboard history
    Hashtag.order('wins DESC').limit(5)
  end
end

  def update_view_count                                  #updates the number of views
    Hashtag.increment_counter(:view_count, self.id)
    self.view_count += 1 
  end
end



