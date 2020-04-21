class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, 
                       confirmation: true, 
                       length: { minimum: 4 }

  has_many :histories
  has_many :events, through: :histories
  has_many :comments

  has_many :favorite_items
  has_many :users, through: :favorite_items
end
