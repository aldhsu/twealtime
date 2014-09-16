class TweetsController < ApplicationController
  require 'tweetstream'
  TweetStream.configure do |config|
    config.consumer_key       = ENV['CONSUMER_KEY']
    config.consumer_secret    = ENV['CONSUMER_SECRET']
    config.oauth_token        = ENV['OAUTH_TOKEN']
    config.oauth_token_secret = ENV['OAUTH_TOKEN_SECRET']
    config.auth_method        = :oauth
  end

  def show
    binding.pry
  end

  def index
    stream = TweetStream::Client.new
    stream.filter({track: 'winning'}) do |status|
      if status.geo.coordinates
        puts "#{status.text}"
        puts status.geo.coordinates
      end
    end
  end
end
