class HistoriesController < ApplicationController

  respond_to :json

  def index
    respond_with History.all
  end

  def show
    respond_with History.find(params[:id])
  end

  def create
    respond_with History.create(params[:history])
  end

  def update
    respond_with History.update(params[:id], params[:history])
  end

  def destroy
    respond_with History.destroy(params[:id])
  end
end
