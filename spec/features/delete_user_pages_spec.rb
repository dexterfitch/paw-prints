require 'rails_helper'

describe "the delete user function" do
  it "delete the user info" do
    visit "/"
    click_on "Register"
    fill_in "Name", :with => "Beethoven"
    fill_in "Email", :with => "fifth@symphony.com"
    fill_in "Password", :with => "what"
    fill_in "Password confirmation", :with => "what"
    click_on "Create User"
    click_on "Beethoven"
    click_on "Delete"
    expect(page).to have_content "destroyed!"
  end
end
