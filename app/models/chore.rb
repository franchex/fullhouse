class Chore < ApplicationRecord
  belongs_to :user
  belongs_to :space
  validates :name, :due_date, presence: true
end
