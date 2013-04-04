class SongsController < ApplicationController

  respond_to :json

  def index
    respond_with Song.all
  end

  def show
    respond_with Song.find(params[:id])
  end

  def create
    respond_with Song.create(params[:song])
  end

  def update
    respond_with Song.update(params[:id], params[:song])
  end

  def destroy
    respond_with Song.destroy(params[:id])
  end
end
