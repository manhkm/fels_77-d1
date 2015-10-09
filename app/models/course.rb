class Course < ActiveRecord::Base
  has_many :lessons, dependent: :destroy
  has_many :users, through: :lessons
  

  validates :name, presence: true
end
