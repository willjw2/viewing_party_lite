require 'rails_helper'

RSpec.describe 'new user page' do
  before :each do
    @user1 = User.create!(name: "William", email: "William@gmail.com")
    @user2 = User.create!(name: "Ashley", email: "Ashley@gmail.com")
    @user3 = User.create!(name: "Abdul", email: "Abdul@gmail.com")

    visit "/register"
  end
  describe 'when I visit /register' do
    it 'i see a form with name and email for new user' do
      visit "/register"

      expect(page).to have_field("Name")
      expect(page).to have_field("Email")
    end

    it 'I see a button to create new user' do
      visit "/register"

      fill_in("Name", with: "Will")
      fill_in("Email", with: "willjw@gmail.com")

      expect(page).to have_button("Register New User")

      click_button("Register New User")

      @user = User.last

      expect(current_path).to eq(user_path(@user.id))
    end
  end
end
