class TweetsController < ApplicationController
  require 'tweetstream'
  TweetStream.configure do |config|
    config.consumer_key       = ENV[CONFIG.CONSUMER_KEY]
    config.consumer_secret    = ENV[CONFIG.CONSUMER_SECRET]
    config.oauth_token        = ENV[CONFIG.OAUTH_TOKEN]
    config.oauth_token_secret = ENV[CONFIG.AUTH_TOKEN_SECRET]
    config.auth_method        = :oauth
  end

  def show
    binding.pry
  end

  def index
    TweetStream::Client.new.locations('-122.75,36.8,-121.75,37.8') do |status|
      puts "#{status.text}"
      puts status.to_hash
      binding.pry
    end
  end
end
