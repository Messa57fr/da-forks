class ReservationsController < ApplicationController

  def new
  end

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @reservation = Reservation.new(reservation_params)
    @reservation.user = current_user
    @reservation.restaurant = @restaurant
    if @reservation.save
      render :show
    else
      redirect_to restaurant_path(@restaurant)
    end
  end

  def show
    @reservation = Reservation.find_by(restaurant: params[:restaurant_id], user: current_user)
  end

  private

  def reservation_params
    params.require(:reservation).permit(:user_id, :restaurant_id, :guest_number, :date)
  end
end