class User < ApplicationRecord
  # Devise modules
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Add an admin role attribute

  def admin?
    role == "admin" || admin
  end

  has_many :reservations, dependent: :destroy
end
