#on click compose user is directed to new path : form.html.erb
require "rails_helper"

feature 'User can create a new message' do
    before do 
        visit welcome_index_path
    end

    describe 'create new message' do
        
        before do
            click_button 'Compose'
        end

        it 'displays recipients field' do
          expect(page).to have_content 'Recipients'
        end
        it 'displays subject field' do
            expect(page).to have_content 'Subject'
        end
        it 'displays message field' do
            expect(page).to have_content 'Message'
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