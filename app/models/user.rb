class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  has_many :groups, foreign_key: 'author_id'

  validates :name, presence: true, length: { in: 3..25 }
end
