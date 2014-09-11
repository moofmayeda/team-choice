class PinsController < ApplicationController

  def index
    @pins = Pins.all
  end

  def show
    @pin = Pin.find(params[:id])
  end

  def new
    @pin = Pin.new
  end

  def create
    @pin = Pin.new(pin_params)
    if @pin.save
      current_user.pins << @pin
      respond_to do |format|
        format.js
      end
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
    params.require(:pin).permit(:name, :lat, :lon, :address)
  end
end
