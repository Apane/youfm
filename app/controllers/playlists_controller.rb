class PlaylistsController < ApplicationController

  respond_to :json

  def index
    respond_with Playlist.all
  end

  def show
    respond_with Playlist.find(params[:id])
  end

  def create
    respond_with Playlist.create(params[:playlist])
  end

  def update
    respond_with Playlist.update(params[:id], params[:playlist])
  end

  def destroy
    respond_with Playlist.destroy(params[:id])
  end
end
