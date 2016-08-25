class SessionsController < ApplicationController

  def new
    # render :login  #directs to the html

  end

  def welcome
    redirect_to '/login'
  end

  def create
    @user = User.find_by_name(params[:user][:name])
    if @user && @user.authenticate(params[:user][:password])
     # Save the user id inside the browser cookie. This is how we keep the user
     # logged in when they navigate around our website.
     session[:user_id] = @user.id
     redirect_to user_path(@user)
    else
   # If user's login doesn't work, send them back to the login form.
     redirect_to '/login'
   end

 end

 def destroy
   session[:user_id] = nil
   redirect_to '/login'
 end

    # case
    # when params[:name]
    #    if !params[:name].empty?
    #       session[:name] = params[:name]
    #       User.new(:name) = session[:name]
    #       #are shown user sign up form
    #       #fill out details
    #       #session[:name] = user[:name]
    #       redirect to user_path(@user)   ## user#show
    #     else
    #       redirect_to '/session/new'
    #     end
    #    redirect_to '/sessions/new'
    # end



end
