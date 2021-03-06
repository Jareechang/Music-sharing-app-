class StaticPagesController < ApplicationController
  def home
    if session[:user_id]
      user = User.find(session[:user_id])
      @test = facebook_friends(user.oauth_token)
    end
  end
  
  private 

  def facebook_friends(token)
    Koala.config.api_version = "v2.0"
    @graph = Koala::Facebook::API.new(token , ENV['FACEBOOK_SECRET'])
    friends = @graph.get_connections("me", "friends")
    friends
  end
end
