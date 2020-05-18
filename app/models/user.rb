class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true

  has_many :favorites #User:Favorite => 1:多
  has_many :player, through: :favorites

  has_many :brand_users
  has_many :brand, through: :brand_users
  
end
