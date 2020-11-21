class Category < ApplicationRecord
  belongs_to :user
  has_many :stories
  has_one_attached :image
end
