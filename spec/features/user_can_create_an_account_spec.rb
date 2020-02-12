require "rails_helper"

feature 'List registration form fields' do
  context 'with articles in db' do
    before do
      visit new_user_registration_path
    end

    it 'displays name field' do
      expect(page).to have_field 'Name'
    end

    # it 'displays email field' do
    #   expect(page).to have_content '/////'
    # end

    # it 'displays password field' do
    #     expect(page).to have_content '/////'
    #   end

    # it 'displays  password confirmation' do
    #     expect(page).to have_content '/////'
    # end
  end
end