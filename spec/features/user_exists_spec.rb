require "rails_helper"

feature 'User already has account' do

  before do
    visit new_user_registration_path
  end
  

  describe 'account exists error' do
    let(:registered_user) {create(:user)} #calls factorybot to create our friend Pierre

  it 'expect error message' do
    fill_in 'Email', with: registered_user.email
    fill_in 'Password', with: 'password'
    click_on 'Create'
    expect(page). to have_content 'Email has already been taken'
  end
  end
end