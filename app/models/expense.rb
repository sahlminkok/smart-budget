class Expense < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'

  has_many :group_expenses
  has_many :groups, through: :group_expenses

  validates :name, presence: true, length: { in: 3..25 }
  validates :amount, numericality: { greater_than_or_equal_to: 0 }
end
