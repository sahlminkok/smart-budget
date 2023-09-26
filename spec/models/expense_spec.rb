require 'rails_helper'

RSpec.describe Expense, type: :model do
  let(:user) { User.create(name: 'user') }

  before { @expense = Expense.create(name: 'Expense', amount: 4.5, author_id: user.id) }

  it 'name should be present' do
    @expense.name = nil
    expect(@expense).to_not be_valid
  end

  it 'amount should be greater than or equal to 0' do
    @expense.amount = -1
    expect(@expense).to_not be_valid
  end

  it 'should belong to an author' do
    expect(@expense.author_id).to eq(user.id)
  end
end
