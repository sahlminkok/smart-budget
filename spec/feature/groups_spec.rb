require 'rails_helper'

RSpec.feature 'Groups', type: :feature do
  let(:user) { create(:user, confirmed_at: Time.now) }

  before do
    login_as(user, scope: :user)
  end

  scenario 'User visits the groups index page' do
    Group.create(author: user, name: 'Group 1', icon: 'grocery.png')
    Group.create(author: user, name: 'Group 2', icon: 'shopping.png')

    visit groups_path

    expect(page).to have_current_path(groups_path)

    expect(page).to have_link('Add new category', href: new_group_path)

    expect(page).to have_content('Categories')

    expect(page).to have_content('Group 1')
    expect(page).to have_content('Group 2')

    expect(page).to have_css("img[alt*='grocery.png']")
    expect(page).to have_css("img[alt*='shopping.png']")

    expect(page).to have_content('₦0.0')

    click_link 'Add new category'
    expect(page).to have_current_path(new_group_path)
  end
end
