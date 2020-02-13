# frozen_string_literal: true

feature 'User can login' do
  before do
    visit user_session_path
  end

  describe 'happy path' do
    let(:registered_user) { create(:user) }

        it 'expect to success message' do
            fill_in 'Email', with: registered_user.email
            fill_in 'Password', with: registered_user.password
            click_on 'Log in'
            expect(page).to have_content 'Signed in successfully.'
        end
  end

  describe 'sad path' do
    let(:registered_user) { create(:user) }

        it 'expect to give message invalid email' do
            fill_in 'Email', with: "wrong@email.com"
            fill_in 'Password', with: registered_user.password
            click_on 'Log in'
            expect(page).to have_content 'Invalid Email or password'
        end
  
        it 'expect to give message invalid password' do
            fill_in 'Email', with: registered_user.email
            fill_in 'Password', with: 'wrongpassword'
            click_on 'Log in'
            expect(page).to have_content 'Invalid Email or password'
        end  
    end    
end