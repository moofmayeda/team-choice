class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @hash = Gmaps4rails.build_markers(@user.pins) do |pin, marker|
      marker.lat pin.lat
      marker.lng pin.lon
    end
  end

end
