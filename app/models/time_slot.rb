class TimeSlot < ApplicationRecord
  validates :start_time, :end_time, :max_tables, presence: true

  has_many :reservations
end
