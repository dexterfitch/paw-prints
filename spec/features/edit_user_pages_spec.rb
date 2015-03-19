require 'rails_helper'

describe "the edit user function" do
  it "opens the edit user page" do
    visit "/"
    click_on "Register"
    fill_in "Name", :with => "Beethoven"
    fill_in "Email", :with => "fifth@symphony.com"
    fill_in "Password", :with => "what"
    fill_in "Password confirmation", :with => "what"
    click_on "Create User"
    click_on "Login"
    fill_in "Email", :with => "fifth@symphony.com"
    fill_in "Password", :with => "what"
    find_button("Login").click
    click_on "Edit"
    expect(page).to have_content "Name"
  end

  it "edits a current users information" do
    visit "/"
    click_on "Register"
    fill_in "Name", :with => "Beethoven"
    fill_in "Email", :with => "fifth@symphony.com"
    fill_in "Password", :with => "what"
    fill_in "Password confirmation", :with => "what"
    click_on "Create User"
    click_on "Login"
    fill_in "Email", :with => "fifth@symphony.com"
    fill_in "Password", :with => "what"
    find_button("Login").click
    click_on "Edit"
    fill_in "Name", :with => "Yohan Beethoven"
    fill_in "Email", :with => "99fifth@symphony.com"
    fill_in "Password", :with => "whatwhat"
    fill_in "Password confirmation", :with => "whatwhat"
    click_on "Update User"
    expect(page).to have_content "Yohan"
  end

  it "throws an error when no user name is entered" do
    visit "/"
    click_on "Register"
    fill_in "Name", :with => "Beethoven"
    fill_in "Email", :with => "fifth@symphony.com"
    fill_in "Password", :with => "what"
    fill_in "Password confirmation", :with => "what"
    click_on "Create User"
    click_on "Login"
    fill_in "Email", :with => "fifth@symphony.com"
    fill_in "Password", :with => "what"
    find_button("Login").click
    click_on "Edit"
    fill_in "Name", :with => ""
    fill_in "Email", :with => "99fifth@symphony.com"
    fill_in "Password", :with => "whatwhat"
    fill_in "Password confirmation", :with => "whatwhat"
    click_on "Update User"
    expect(page).to have_content "blank"
  end

  it "throws an error when no user email is entered" do
    visit "/"
    click_on "Register"
    fill_in "Name", :with => "Beethoven"
    fill_in "Email", :with => "fifth@symphony.com"
    fill_in "Password", :with => "what"
    fill_in "Password confirmation", :with => "what"
    click_on "Create User"
    click_on "Login"
    fill_in "Email", :with => "fifth@symphony.com"
    fill_in "Password", :with => "what"
    find_button("Login").click
    click_on "Edit"
    fill_in "Name", :with => "Yohan Beethoven"
    fill_in "Email", :with => ""
    fill_in "Password", :with => "whatwhat"
    fill_in "Password confirmation", :with => "whatwhat"
    click_on "Update User"
    expect(page).to have_content "blank"
  end

  it "throws an error when no user password is entered" do
    visit "/"
    click_on "Register"
    fill_in "Name", :with => "Beethoven"
    fill_in "Email", :with => "fifth@symphony.com"
    fill_in "Password", :with => "what"
    fill_in "Password confirmation", :with => "what"
    click_on "Create User"
    click_on "Login"
    fill_in "Email", :with => "fifth@symphony.com"
    fill_in "Password", :with => "what"
    find_button("Login").click
    click_on "Edit"
    fill_in "Name", :with => "Yohan Beethoven"
    fill_in "Email", :with => "99fifth@symphony.com"
    fill_in "Password", :with => ""
    fill_in "Password confirmation", :with => "whatwhat"
    click_on "Update User"
    expect(page).to have_content "errors"
  end

  it "throws an error when no user password confirmation is entered" do
    visit "/"
    click_on "Register"
    fill_in "Name", :with => "Beethoven"
    fill_in "Email", :with => "fifth@symphony.com"
    fill_in "Password", :with => "what"
    fill_in "Password confirmation", :with => "what"
    click_on "Create User"
    click_on "Login"
    fill_in "Email", :with => "fifth@symphony.com"
    fill_in "Password", :with => "what"
    find_button("Login").click
    click_on "Edit"
    fill_in "Name", :with => "Yohan Beethoven"
    fill_in "Email", :with => "99fifth@symphony.com"
    fill_in "Password", :with => "whatwhat"
    fill_in "Password confirmation", :with => ""
    click_on "Update User"
    expect(page).to have_content "errors"
  end
end
