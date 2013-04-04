class PlaylistjoinsController < ApplicationController

  respond_to :json

  def index
    respond_with Playlistjoin.all
  end

  def show
    respond_with Playlistjoin.find(params[:id])
  end

  def create
    respond_with Playlistjoin.create(params[:playlistjoin])
  end

  def update
    respond_with Playlistjoin.update(params[:id], params[:playlistjoin])
  end

  def destroy
    respond_with Playlistjoin.destroy(params[:id])
  end
end
