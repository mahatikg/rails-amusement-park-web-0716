class SessionsController < ApplicationController

  def new
    # @user = User.new
  end

  def welcome
    # redirect_to '/login'
  end

  def create
    user = User.find_by(params[:user][:name])
# binding.pry
    if user && user.authenticate(params[:user][:password_digest])
      session[:user_id] = user.id
      flash[:notice] ="Hello"
      redirect_to user_path(@user)

    else
      render :new
    end

  end

  def destroy
    session[:user_id] = nil
    flash[:notice] ="Hello"
    redirect_to '/login'
  end










end
