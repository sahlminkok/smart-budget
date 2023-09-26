class Group < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'

  has_many :group_expenses
  has_many :expenses, through: :group_expenses
end
