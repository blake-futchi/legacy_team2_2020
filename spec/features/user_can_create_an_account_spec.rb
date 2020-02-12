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
        describe 'with invalid email' do
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
    end
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

