class WebsocketController < WebsocketRails::BaseController
  # require 'tweetstream'
  # TweetStream.configure do |config|
  #   config.consumer_key       = ENV['CONSUMER_KEY']
  #   config.consumer_secret    = ENV['CONSUMER_SECRET']
  #   config.oauth_token        = ENV['OAUTH_TOKEN']
  #   config.oauth_token_secret = ENV['OAUTH_TOKEN_SECRET']
  #   config.auth_method        = :oauth
  # end

  # config insta

  def new
    # puts data
  end

  def test
    puts 'test'
    #change  to take redirect url
    Thread.new do |t|
      # change to take callbackurl
      Instagram.create_subscription('tag', "http://c709747.ngrok.com/events/listen",'media', {object_id: 'cats'})
      t.exit
    end
  end

  def listener
  end

  def stream
    # stream = TweetStream::Client.new
    # count = 0
    # stream.filter({track: 'winning'}) do |status|
    #   count += 1
    #   unless status.geo.coordinates.nil?
    #     puts count
    #     send_message message, {text: "#{status.text}", coordinates:"#{status.geo.coordinates}"}
    #     puts status.geo.coordinates, status.place, status.location
    #   end
    # end
  end
end