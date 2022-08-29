class Space < ApplicationRecord
  has_many :assignments
  has_many :users, through: :assignment
  has_many :tasks
  has_many :chores
  has_many :expenses
  has_many :bills
  has_many :shopping_lists
  validates :name, presence: true
end
