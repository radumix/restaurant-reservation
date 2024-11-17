class ReservationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @reservations = current_user.reservations
  end

  def new
    @reservation = Reservation.new
    @time_slots = TimeSlot.all
  end

  #   def create
  #     @reservation = current_user.reservations.build(reservation_params)
  #     if @reservation.save
  #       redirect_to @reservation, notice: "Reservation created successfully."
  #     else
  #       render :new, status: :unprocessable_entity
  #     end
  #   end

  def create
    @reservation = current_user.reservations.build(reservation_params)
    if @reservation.save
      ReservationMailer.reservation_confirmation(current_user, @reservation).deliver_now
      redirect_to @reservation, notice: "Reservation created successfully and a confirmation email has been sent."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @reservation = Reservation.find(params[:id])
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.destroy
    redirect_to reservations_path, notice: "Reservation canceled successfully."
  end

  private

  def reservation_params
    params.require(:reservation).permit(:date, :num_people)
  end
end
