class TracksController < ApplicationController
  def add_tracks
    # create a client object with your app credentials
    client = Soundcloud.new(:client_id => '469a718d885e7cec05d02939174291c7')

    # find all sounds of buskers licensed under 'creative commons share alike'
    @tracks = client.get('/tracks', :q => params[:text], :limit => 20)
    

    @tracks.map! do |obj| 
      # Sends request to soundcloud API to gather all the Oembed info 
      # and gathers only the html widget for embedding into website 
      client.get('/oembed', :url => obj[:permalink_url])[:html]
    end 

    render json: @tracks
  end
end
