class Favorite < ApplicationRecord
  belongs_to :user #User:Favorite => 1:多
  belongs_to :player #Book:Favorite => 1:多
end
