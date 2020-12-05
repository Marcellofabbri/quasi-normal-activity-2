class Category < ApplicationRecord
  belongs_to :user
  has_many :stories, dependent: :delete_all
  has_one_attached :image
end
