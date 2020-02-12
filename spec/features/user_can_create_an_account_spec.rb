require "rails_helper"

feature 'user can create a new account' do
  before do
    visit new_user_registration_path
  end

  feature 'happy path' do
 
    before do
      fill_in 'Name', with: 'Blake'
      fill_in 'Email', with: 'email@email.com'
      fill_in 'Password', with: 'password'
      fill_in 'Password confirmation', with: 'password'

      click_on 'Create'
    end

    # redundant tests
    # it 'displays name field' do
    #   expect(page).to have_field 'Name'
    # end

    # it 'displays email field' do
    #   expect(page).to have_field 'Email'
    # end

    # it 'displays password field' do
    #   expect(page).to have_field 'Password'
    # end

    # it 'displays  password confirmation' do
    #   expect(page).to have_field 'Password confirmation'
    # end

    it 'displays welcome message' do
      expect(page).to have_content 'Hello, Blake'
    end

    it 'redirects to root path' do
      expect(current_path).to eq root_path
    end
    
  end
end

