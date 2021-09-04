class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :book
  
  validates_uniqueness_of :book, scope: :user
end
