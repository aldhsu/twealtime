class SessionsController < ApplicationController
  def create
  end

  def destroy
  end

  def new
   redirect_to "https://api.instagram.com/oauth/authorize/?client_id=#{ENV['CLIENT_ID']}&redirect_uri=#{REDIRECT_URL}&response_type=code"
  end

  def insta_sub
    render text: params["hub.challenge"]
  end
end
