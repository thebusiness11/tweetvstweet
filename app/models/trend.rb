class Trend < ActiveRecord::Base
  attr_accessible :name, :query, :url

  def self.trends_pull
  	# Twitter.trends().results.map do |trends|
   #    create!(
   #      name: trends.name,
   #      query: tweet.query,
   #      url: trends.url
   #        ) 
   #    end   
  end

  def self.trends_display
  	 Hashlog.order('count DESC').limit(10)
  end
end
