# spec/features/expenses_spec.rb

require 'rails_helper'

RSpec.feature 'Expenses', type: :feature do
  let(:user) { create(:user, confirmed_at: Time.now) }
  let(:group) { Group.create(author: user, name: 'Group 1', icon: 'grocery.png') }

  before do
    login_as(user, scope: :user)
  end

  scenario 'User visits the expenses index page' do
    # Create some sample expenses associated with the group
    expense1 = Expense.create(name: 'Expense 1', amount: 100, author: user)
    expense2 = Expense.create(name: 'Expense 2', amount: 200, author: user)
    group.expenses << [expense1, expense2]

    visit group_expenses_path(group)

    expect(page).to have_current_path(group_expenses_path(group))

    expect(page).to have_link(nil, href: root_path)

    expect(page).to have_content('Transactions')

    expect(page).to have_content('Total Amount:')
    expect(page).to have_content("₦#{group.total_amount}")

    expect(page).to have_content('Expense 1')
    expect(page).to have_content('₦100.0')
    expect(page).to have_content('Expense 2')
    expect(page).to have_content('₦200.0')

    expect(page).to have_link('Add new transaction', href: new_group_expense_path(group), class: 'btn')
  end
end
