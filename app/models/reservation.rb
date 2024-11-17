class Reservation < ApplicationRecord
  belongs_to :user
  validates :date, presence: true
  validates :num_people, presence: true

  # Custom validation for reservation rules
  validate :reservation_time_valid?

  private

  def reservation_time_valid?
    if date < Time.now + 2.hours
      errors.add(:date, "must be at least 2 hours in advance")
    end
  end
end
