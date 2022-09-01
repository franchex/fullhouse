class ShoppingList < ApplicationRecord
  belongs_to :space
  validates :name, presence: true
  has_many :items
end
