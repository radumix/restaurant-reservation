module Admin
  class ReservationsController < ApplicationController
    before_action :authenticate_user!
    before_action :authorize_admin

    def index
      @reservations = Reservation.all.order(date: :asc)
    end

    def index
      @role = current_user.role  # Assuming current_user is the logged-in user
    end

    def update
      @reservation = Reservation.find(params[:id])
      if @reservation.update(reservation_params)
        redirect_to admin_reservations_path, notice: "Reservation updated successfully."
      else
        render :edit, status: :unprocessable_entity
      end
    end

    private

    def authorize_admin
      redirect_to root_path, alert: "Access denied." unless current_user.admin?
    end

    def reservation_params
      params.require(:reservation).permit(:date, :num_people, :status)
    end
  end
end
