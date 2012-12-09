class ApplicationController < ActionController::Base
  protect_from_forgery

before_filter :set_current_user
before_filter :stats

  def set_current_user
    User.current_user = current_user
  end
  
rescue_from CanCan::AccessDenied do |exception|
  redirect_to main_app.root_url, :alert => exception.message
end

def stats
	@stats_total = Hashtag.count 
	@stats_wins = Hashtag.sum(:wins)
	@stats_views = Hashtag.sum(:view_count)

	@stats_losers = (@stats_views - @stats_wins) 

end

end
