class PinsController < ApplicationController

  def index
    @pins = Pin.all

    @hash = Gmaps4rails.build_markers(@pins) do |pin, marker|
      marker.lat pin.lat
      marker.lng pin.lon
    end
  end

  def show
    @pin = Pin.find(params[:id])

    @hash = Gmaps4rails.build_markers(@pin) do |pin, marker|
      marker.lat pin.lat
      marker.lng pin.lon
    end
  end

  def new
    @pin = Pin.new
  end

  def create
    @pin = Pin.new(pin_params)
    if @pin.save
      current_user.pins << @pin
      flash[:notice]= "Pin created and added to your visits!"
      redirect_to user_path(current_user)
    else
      render 'new'
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

private
  def pin_params
    params.require(:pin).permit(:name, :lat, :lon)
  end
end
