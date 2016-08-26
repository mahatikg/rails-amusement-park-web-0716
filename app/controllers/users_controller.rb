class UsersController < ApplicationController
  before_action :set_params, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all

  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
     else
       render '/signup'
    end

  end




  def show
    authenticate_user
    @notice = params[:notice]
  end



  def edit
  end

  def update
    if @user.update(user_params)
        redirect_to @user
    else
      render :edit
    end
  end

  # def destroy
  # end

  # def mood
  #   #if nausea > happiness return "sad"
  #   #elsif nausea equal happiness return "go on a ride"
  #   #else return "happy"
  # end

  private
  
  def set_params
    @user = User.find(params[:id])
   end

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation, :height, :happiness, :nausea, :tickets, :session_id)
  end
end
