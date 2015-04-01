class TracksController < ApplicationController
  def add_tracks
    # create a client object with your app credentials
    client = Soundcloud.new(:client_id => '469a718d885e7cec05d02939174291c7')

    # find all sounds of buskers licensed under 'creative commons share alike'
    @tracks = client.get('/tracks', :q => params[:text], :limit => 20)
    render json: @tracks
  end
end
