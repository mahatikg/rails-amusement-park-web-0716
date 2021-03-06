class AttractionsController < ApplicationController
  before_action :set_params, only: [:show, :edit, :update, :destroy]
  def index
    @attractions = Attraction.all
  end

  def new
    @attraction = Attraction.new
  end

  def create
    @attraction = Attraction.new(attraction_params)
    redirect_to attraction_path(@attraction)
    else
      render :new
    end

  end

  def show
    @ride = Ride.new

  end



  def edit
  end

  def update
    @attraction.update(attraction_params)
        # redirect_to @attraction
    else
      # render :edit
    end
  end

  def destroy
  end
  
  private
  def set_params
    @attraction = Attraction.find(params[:id])
   end

  def attraction_params
    params.require(:attraction).permit(:name, :min_height, :happiness_rating, :nausea_rating, :tickets)
  end
end
