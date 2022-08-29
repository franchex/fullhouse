class Expense < ApplicationRecord
  belongs_to :user
  belongs_to :space
  validates :amount, :name, presence: true
end
