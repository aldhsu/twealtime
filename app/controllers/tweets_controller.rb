class TweetsController < ApplicationController
  skip_before_action :verify_authenticity_token
  def show
  end

  def index
    session[:instagram_code] = params[:code]
  end

  def instasign
  end

  def listen
    Thread.new do |t|
      # need to change this to interpolate tag or loc
        response = HTTParty.get("https://api.instagram.com/v1/tags/winning/media/recent?client_id=#{ENV['CLIENT_ID']}")
        json = JSON.parse(response)
        json.data.each do |post|
          puts post.location.latitude, post.location.longitude
        end
      t.exit
    end
    render nothing: true
  end
end
