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
  Instagram.configure do |config|
    config.client_id = ENV['CLIENT_ID']
    config.client_secret = ENV['CLIENT_SECRET']
      # For secured endpoints only
    #config.client_ips = '<Comma separated list of IPs>'
  end

  def new
    # puts data
  end

  def test
    puts 'test'
    session[:access_token] = Instagram.get_access_token(session[:instagram_code],redirect_uri: "http://c709747.ngrok.com/tweets").access_token
    Thread.new do |t|
      Instagram.create_subscription('tag', "http://c709747.ngrok.com/tweets/listen",'media', {object_id: 'cats'})
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