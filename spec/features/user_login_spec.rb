require 'rails_helper'

RSpec.feature "Vistor logs in with email and password", type: :feature, js: true do
  before :each do
    @user = User.create!(
      first_name: "Alice", 
      last_name: "Test", 
      email: "test@test.com",
      password:"password",
      password_confirmation:"password"
    )

  end

    scenario 'User completes login form' do

      # visit home page
      visit root_path

      # click on login
      click_on 'Login'

      # fill in email and password
      fill_in 'email', with: 'test@test.com'
      fill_in 'password', with: 'password'

      # click submit
      click_on 'Submit'

      # check that name and logout button is in on page
      expect(page).to have_text('Alice')
      expect(page).to have_text('Logout')

      # save_screenshot

  end
end
