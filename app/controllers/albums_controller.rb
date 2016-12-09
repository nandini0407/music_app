class AlbumsController < ApplicationController

  before_action :require_user

  def new
    @band = Band.find_by_id(params[:id])
    render :new
  end

  def create
    @album = Album.new(album_params)
    if @album.save
      redirect_to album_url(@album)
    else
      flash.now[:errors] = @album.errors.full_messages
      render :new
    end
  end

  def edit
    @album = Album.find_by_id(params[:id])
    render :edit
  end

  def update
    @album = Album.find_by_id(params[:id])
    if @album.update(album_params)
      redirect_to album_url(@album)
    else
      flash.now[:errors] = @album.errors.full_messages
      render :edit
    end
  end

  def show
    @album = Album.find_by_id(params[:id])
    render :show
  end

  def destroy
    @album = Album.find_by_id(params[:id])
    @album.destroy
    redirect_to bands_url
  end

  private

  def album_params
    params.require(:album).permit(:name, :band_id, :category)
  end

end
