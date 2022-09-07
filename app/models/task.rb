class Task < ApplicationRecord
  belongs_to :user
  belongs_to :space
  validates :description, presence: true
end
