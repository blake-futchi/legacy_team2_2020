require "rails_helper"

feature 'User can create a new account' do
  before do 
    visit new_user_registration_path
  end

  describe 'successfully' do
    before do             
      fill_in 'Name', with: 'Blake'
      fill_in 'Email', with: 'example@email.com'
      fill_in 'Password', with: 'password'
      fill_in 'Password confirmation', with: 'password'
      click_on 'Create'
  end

      it 'displays welcome message' do
        expect(page).to have_content 'Hello, Blake'
      end

      it 'redirects to root path' do
        expect(current_path).to eq root_path
      end
    end

  describe 'unsuccessfully' do
    describe 'with invalid email and password' do
      before do
        fill_in 'Name', with: 'Blake'
        fill_in 'Email', with: 'email.com'
        fill_in 'Password', with: 'pass'
        fill_in 'Password confirmation', with: 'pass'
        click_on 'Create'
      end

      it 'returns email error message' do
        expect(page).to have_content 'Email is invalid'
      end

      it 'returns password error message' do
        expect(page).to have_content 'Password is too short'
      end
    end
    
    describe 'account exists error' do
      let(:registered_user) {create(:user)} 
  
    it 'expect error message' do
      fill_in 'Email', with: registered_user.email
      fill_in 'Password', with: 'password'
      click_on 'Create'
      expect(page). to have_content 'Email has already been taken'
    end
    end
  end
end