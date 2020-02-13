require "rails_helper"


  
describe 'Factory' do
  it 'should have valid Factory' do
    expect(FactoryBot.create(:user)).to be_valid
  end  
end
