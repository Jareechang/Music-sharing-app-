class TracksController < ApplicationController
  def add_tracks
    # create a client object with your app credentials
    client = Soundcloud.new(:client_id => ENV['SOUNDCLOUD_CLIENT_ID'])

    find all sounds of buskers licensed under 'creative commons share alike'
    @tracks = client.get('/tracks', :q => params[:text], :limit => 20) 

    @tracks.map! do |obj| 
      # Sends request to soundcloud API to gather all the Oembed info 
      # and gathers only the html widget for embedding into website 
      oembed = client.get('/oembed', :url => obj[:permalink_url])[:html].split(' ')
      oembed[1]  = "width=\"30%\""
      oembed[2]  = "width=\"100\""
      oembed.join(' ')
    end 

    # Respond in JSON format 
    render json: @tracks
  end
end
