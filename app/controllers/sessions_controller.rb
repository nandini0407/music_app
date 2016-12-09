class SessionsController < ApplicationController

  def new
    render :new
  end

  def create
    @user = User.find_by_credentials(params[:user][:email], params[:user][:password])
    if @user.nil?
      flash.now[:errors] = ["Invalid email and/or password"]
      render :new
    else
      login(@user)
      redirect_to bands_url
    end
  end

  def destroy
    logout
    redirect_to new_session_url
  end

  def show
    @user = User.find_by_id(params[:id])
    render :show
  end

  private

  def session_params
    params.require(:session).permit(:email, :password, :session_token)
  end

end
