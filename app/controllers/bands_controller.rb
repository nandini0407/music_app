class BandsController < ApplicationController

  before_action :require_user

  def index
    @bands = Band.all
  end

  def create
    @band = Band.new(band_params)
    if @band.save
      redirect_to band_url(@band)
    else
      flash.now[:errors] = @band.errors.full_messages
      render :new
    end
  end

  def new
    render :new
  end

  def edit
    @band = Band.find_by_id(params[:id])
    render :edit
  end

  def update
    @band = Band.find_by_id(params[:id])
    if @band.update(band_params)
      redirect_to band_url(@band)
    else
      flash.now[:errors] = @band.errors.full_messages
      render :new
    end
  end

  def show
    @band = Band.find_by_id(params[:id])
    render :show
  end

  def destroy
    @band = Band.find_by_id(params[:id])
    @band.destroy
    redirect_to bands_url
  end

  private

  def band_params
    params.require(:band).permit(:name)
  end

end