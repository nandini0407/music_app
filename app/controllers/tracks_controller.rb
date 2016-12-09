class TracksController < ApplicationController

  before_action :require_user

  def new
    @album = Album.find_by_id(params[:id])
    render :new
  end

  def create
    @track = Track.new(track_params)
    if @track.save
      redirect_to track_url(@track)
    else
      flash.now[:errors] = @track.errors.full_messages
      render :new
    end
  end

  def edit
    @track = Track.find_by_id(params[:id])
    render :edit
  end

  def update
    @track = Track.find_by_id(params[:id])
    if @track.update(track_params)
      redirect_to track_url(@track)
    else
      flash.now[:errors] = @track.errors.full_messages
      render :edit
    end
  end

  def show
    @track = Track.find_by_id(params[:id])
    render :show
  end

  def destroy
    @track = Track.find_by_id(params[:id])
    @track.destroy
    redirect_to bands_url
  end

  private

  def track_params
    params.require(:track).permit(:name, :album_id, :category, :lyrics)
  end

end
