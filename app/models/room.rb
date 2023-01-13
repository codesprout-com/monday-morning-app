class Room < ApplicationRecord
  has_many :room_users
  has_many :users, through: :room_users

  validates :opened_at, presence: true

  has_many :messages
end
