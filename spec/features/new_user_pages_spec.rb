require 'rails_helper'

describe "the create user function" do
  it "opens the new user page" do
    visit "/"
    click_on "Register"
    expect(page).to have_content "Name"
  end

  it "creates a new user" do
    visit "/"
    click_on "Register"
    fill_in "Name", :with => "Beethoven"
    fill_in "Email", :with => "fifth@symphony.com"
    fill_in "Password", :with => "what"
    fill_in "Password confirmation", :with => "what"
    click_on "Create User"
    expect(page).to have_content "Users"
  end

  it "throws an error when no name is entered" do
    visit "/"
    click_on "Register"
    fill_in "Email", :with => "fifth@symphony.com"
    fill_in "Password", :with => "what"
    fill_in "Password confirmation", :with => "what"
    click_on "Create User"
    expect(page).to have_content "problem"
  end

  it "throws an error when no email is entered" do
    visit "/"
    click_on "Register"
    fill_in "Name", :with => "Beethoven"
    fill_in "Password", :with => "what"
    fill_in "Password confirmation", :with => "what"
    click_on "Create User"
    expect(page).to have_content "problem"
  end

  it "throws an error when no password is entered" do
    visit "/"
    click_on "Register"
    fill_in "Name", :with => "Beethoven"
    fill_in "Email", :with => "fifth@symphony.com"
    fill_in "Password confirmation", :with => "what"
    click_on "Create User"
    expect(page).to have_content "problem"
  end

  it "throws an error when no password confirmation is entered" do
    visit "/"
    click_on "Register"
    fill_in "Name", :with => "Beethoven"
    fill_in "Email", :with => "fifth@symphony.com"
    fill_in "Password", :with => "what"
    click_on "Create User"
    expect(page).to have_content "problem"
  end
end
