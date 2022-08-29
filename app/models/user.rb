class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :assignments
  has_many :spaces, through: :assignment
  has_many :tasks
  has_many :chores
  has_many :bills
  has_many :expenses
  has_many :shopping_lists
  validates :first_name, :last_name, presence: true
end
