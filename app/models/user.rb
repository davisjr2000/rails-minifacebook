class User < ApplicationRecord
  has_many :posts, :dependent => :destroy
  validates :name, presence: true
  validates :github, presence: true
  validates :job, presence: true
  validates :food, presence: true
end
