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
    respond_to do |format|
      format.html { render 'new' }
      format.js
    end
    authorize! if can? :create, @pin
  end

  def create
    @pin = Pin.new(pin_params)
    if @pin.save
      current_user.pins << @pin
      if request.referer.include?('users')
        @hash = Gmaps4rails.build_markers(current_user.pins) do |pin, marker|
          marker.lat pin.lat
          marker.lng pin.lon
        end
      else request.referer.include?('pins')
        @hash = Gmaps4rails.build_markers(Pin.all) do |pin, marker|
          marker.lat pin.lat
          marker.lng pin.lon
        end
      end
      flash.now[:notice]= "Pin created and added to your visits!"
      respond_to do |format|
        format.html { render 'new' }
        format.js
      end
    else
      render 'new'
    end
    authorize! if can? :create, @pin
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
