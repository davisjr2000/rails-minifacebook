class User < ApplicationRecord
  has_many :posts, :dependent => :destroy
  has_many :comments, :dependent => :destroy
  validates :name, presence: true
  validates :github, presence: true, uniqueness: { message: "This github is already being used." }
  validates :job, presence: true
  validates :food, presence: true
end
