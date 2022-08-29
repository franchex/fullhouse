class Task < ApplicationRecord
  belongs_to :user
  belongs_to :space
  validates :name, presence: true
end
