class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :user_skills
  has_many :skills, through: :user_skills

  has_many :user_interests
  has_many :interests, through: :user_interests

  has_many :room_users
  has_many :rooms, through: :room_users

  has_many :messages
end
