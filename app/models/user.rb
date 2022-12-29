class User < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged
  validates :email, presence: true, uniqueness: true


  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :trackable,
         :recoverable, :rememberable, :validatable, :lockable
end
