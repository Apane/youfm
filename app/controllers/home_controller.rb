class HomeController < ApplicationController

  def index
  end

  def addtoplaylist
    my_string = params[:songid]
    if my_string.include? "spotify"
      @song = Song.where("titlehref = ?", params[:songid]).first
      if @song.blank?
        @song = Song.create({:titlehref => params[:songid], :title => params[:songname], :artisthref => params[:artistid], :artist => params[:artistname], :albumhref => params[:albumid], :album => params[:albumname], :popularity => params[:popularity]})
      end
    else
      @song = Song.create({:titlehref => params[:songid], :title => params[:songname], :artisthref => params[:artistid], :artist => params[:artistname], :albumhref => params[:albumid], :album => params[:albumname], :popularity => params[:popularity]})
    end 
    Playlistjoin.create({:playlistid => params[:playlistid],:songid => @song.id, :userid => params[:userid]})
      render :nothing => true
  end

  def addtohistory
    my_string = params[:songid]
    if my_string.include? "spotify"
      @song = Song.where("titlehref = ?", params[:songid]).first
      if @song.blank?
        @song = Song.create({:titlehref => params[:songid], :title => params[:songname], :artisthref => params[:artistid], :artist => params[:artistname], :albumhref => params[:albumid], :album => params[:albumname], :popularity => params[:popularity]})
      end
    else
      @song = Song.create({:titlehref => params[:songid], :title => params[:songname], :artisthref => params[:artistid], :artist => params[:artistname], :albumhref => params[:albumid], :album => params[:albumname], :popularity => params[:popularity]})
    end  
    History.create({:songid => @song.id, :userid => params[:userid]})
      render :nothing => true
  end

  def search
    require 'open-uri'
  	require 'json'

  	@query = params[:query]

  	@response = open("http://ws.spotify.com/search/1/track.json?q="+@query).read
      JSON.parse(@response)
      render :json => @response
    
  end

  def album
    require 'open-uri'
    require 'json'

    @query = params[:query]

    @response = open("http://ws.spotify.com/lookup/1/.json?uri="+@query+"&extras=trackdetail").read
      JSON.parse(@response)
      render :json => @response
    
  end

  def new
    require 'open-uri'
    require 'nokogiri'
    @response = Nokogiri.XML(open("http://itunes.apple.com/WebObjects/MZStore.woa/wpa/MRSS/newreleases/sf=143441/limit=100/explicit=true/rss.xml").read)
      render :xml => @response
    
  end

  def top
    require 'open-uri'
    require 'nokogiri'
    @response = Nokogiri.XML(open("http://itunes.apple.com/us/rss/topsongs/limit=100/explicit=true/xml").read)
      render :xml => @response
    
  end

  def picks
      render :partial => "picks"
  end

  def youtube
    require 'open-uri'
    require 'json'

    @searchstring = params[:ysearch]

    @response = open("https://gdata.youtube.com/feeds/api/videos?q="+@searchstring+"&alt=jsonc&v=2&max-results=2").read
    JSON.parse(@response)

    render :json => @response
  
  end

end






