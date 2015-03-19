require 'rails_helper'

describe "the delete user function" do
  it "delete the user info" do
    visit "/"
    click_on "Register"
    fill_in "Name", :with => "Beethoven"
    fill_in "Email", :with => "fifth@symphony.com"
    fill_in "Password", :with => "what"
    fill_in "Password confirmation", :with => "what"
    attach_file('Avatar', 'public/test/baethoven.jpg')
    click_on "Submit"
    click_on "Login"
    fill_in "Email", :with => "fifth@symphony.com"
    fill_in "Password", :with => "what"
    find_button("Login").click
    click_on "Delete"
    expect(page).to have_content "destroyed!"
  end
end
