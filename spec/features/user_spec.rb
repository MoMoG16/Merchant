require 'rails_helper'

feature "User management" do

  before { visit root_path }

  scenario "allows registration for a new user" do

    click_link "Sign Up!"
    save_and_open_page

    fill_in "Email", with: "foo@bar.com"
    fill_in "user_password", with: "password"
    fill_in "Password Confirmation", with: "password"

    click_button "Sign Up"

    expect(page).to have_content("Welcome! You have signed up successfully")
  end

  scenario "does not allow registration with no info" do
  end


end