# Twitter.configure do |config|
#   config.consumer_key = ENV["TWITTER_CONSUMER_KEY"]
#   config.consumer_secret = ENV["TWITTER_CONSUMER_SECRET"]
#  end



# Twitter.configure do |config|
#   # config.consumer_key = "Ge8PTxiJYToqYncUv8IL9Q"
#   # config.consumer_secret = "ZE39HxCsXS0CZyZpYnCvXVuug7LqmXhCgb7QP9a6IM"
#   # # config.oauth_token = "532554631-uS3yCGSsRBtbLf1w2apEudWQISSxVhpzBubYasB3"
#   # config.oauth_token_secret = "NnEfhpsrUncr9DxxXhLopUuFTNOjFTSdSSWU6aYkoA"
# end

Twitter.configure do |config|
  config.consumer_key = ENV["TWITTER_CONSUMER_KEY"]
  config.consumer_secret = ENV["TWITTER_CONSUMER_SECRET"]
  config.oauth_token = ENV["TWITTER_OAUTH_TOKEN"]
  config.oauth_token_secret = ENV["TWITTER_OAUTH_TOKEN_SECRET"]
end

# require 'twitter'
# class TwitterToken < ConsumerToken
#   TWITTER_SETTINGS={:site=>"http://api.twitter.com", :request_endpoint => 'http://api.twitter.com',}
#   def self.consumer
#     @consumer||=OAuth::Consumer.new credentials[:key],credentials[:secret],TWITTER_SETTINGS
#   end

#   # def client
#     Twitter.configure do |config|
#       config.consumer_key = TwitterToken.consumer.key
#       config.consumer_secret = TwitterToken.consumer.secret
#       config.oauth_token = token
#       config.oauth_token_secret = secret
#     end
# #     @client ||= Twitter::Client.new
# #   end
# # end