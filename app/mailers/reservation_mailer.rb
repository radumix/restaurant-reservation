class ReservationMailer < ApplicationMailer
  default from: "notifications@restaurant.com"

  def reservation_confirmation(user, reservation)
    @user = user
    @reservation = reservation
    mail(to: @user.email, subject: "Reservation Confirmation")
  end
end

# class ReservationMailer < ApplicationMailer
#   default from: "no-reply@restaurantapp.com"

#   def reservation_confirmation(reservation)
#     @reservation = reservation
#     mail(to: @reservation.user.email, subject: "Your Reservation Confirmation")
#   end
# end
