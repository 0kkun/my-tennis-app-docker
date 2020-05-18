class Brand < ApplicationRecord
  has_many :brand_users
  has_many :users, through: :brand_users
end
