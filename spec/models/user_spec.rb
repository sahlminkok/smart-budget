require 'rails_helper'

RSpec.describe User, type: :model do
  let!(:user) { create(:user) }

  before do
    allow_any_instance_of(Devise::Mailer).to receive(:confirmation_instructions).and_return(double(deliver: true))
  end

  it 'name should be present' do
    expect(user.name).to eq('user')
  end

  it 'email should be present' do
    expect(user.email).to eq('example@example.com')
  end

  it 'password should be present' do
    expect(user.password).to eq('password')
  end
end
