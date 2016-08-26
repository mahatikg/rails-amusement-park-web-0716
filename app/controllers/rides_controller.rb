class RidesController < ApplicationController


  before_action :set_params, only: [:show, :edit, :update, :destroy]

  def index
    #@rides = Ride.all
  end

  def new
  end

  def create
    @ride = Ride.create(user_id: params[:ride])
    if @ride.save
      redirect_to user_path()
    else
      render :new
    end

  def show
  end

  private

  def ride_params
    params.require(:ride).permit(:user_id, :attraction_id)
  end




  end



    #
    # def met_requirements
    #   if (@user.tickets > @attraction.tickets) && (@user.height > @attraction.min_hieght)
    #     "Thanks for riding #{@attraction.name}!"
    #     #call method tix_update
    #     #call method mood_update
    #   else
    #     "Sorry. You do not have enough tickets the #{@attraction.name}. You are not tall enough to ride the #{@attraction.name}."
    #   end


    # def tix_update
    #   @user.tickets = @user.tickets - @attraction.tickets
    # end
    #
    # def mood_update
    #   @user.happiness = @user.happiness - @attraction.happiness
    # end







  end


  def destroy
  end



  private
   def set_params
    @users = User.find(params[:id])
   end

  # def user_params
  #   params.require(:users).permit(:name, :password, :height, :happiness, :nausea, :tickets)
  # end




end
