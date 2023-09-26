require 'rails_helper'

RSpec.describe Group, type: :model do
  let!(:user) { create(:user) }

  before do
    allow_any_instance_of(Devise::Mailer).to receive(:confirmation_instructions).and_return(double(deliver: true))
    @group = Group.create(name: 'group', icon: 'icon', author_id: user.id)
  end

  it 'name should be present' do
    @group.name = nil
    expect(@group).to_not be_valid
  end

  it 'name length should be > 3 and < 25 chars' do
    @group.name = 'sa'
    expect(@group).to_not be_valid
  end
end
