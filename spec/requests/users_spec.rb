require 'spec_helper'

describe "Users" do

  it "creates a new user as a guest" do
    visit sign_up_path
    fill_in "Name", with: "foo"
    fill_in "Email", with: "foo@bar.com"
    fill_in "Username", with: "foobar"
    fill_in "Password", with: "secret"
    fill_in "Password confirmation", with: "secret"
    click_button "Sign Up"
    page.should have_content "Signed up"
  end

  it "shows a user as a guest" do
    user = create(:user)
    visit user_path user
    page.should have_content "Not authorized"
  end

  it "edits user's profile" do
    log_in
    visit edit_user_path @_current_user
    page.should have_content "Edit Your Profile"
  end

  it "should deny editing other member's profile" do
    user = create(:user)
    log_in
    visit edit_user_path user
    page.should have_content("Not authorized")
  end

  it "should update a user profile as member" do
    log_in name: "Foo Bar"
    visit edit_user_path @_current_user
    page.should have_content "Edit Your Profile"
    fill_in "Name", with: "Foo Baz"
    click_button "Save Changes"
    page.should have_content "Profile successfully updated."
    page.should have_content "Foo Baz"
    page.should_not have_content "Foo Bar"
  end

  it "should allow an admin to update other user's profiles" do
    user = create(:user)
    log_in admin: true
    visit edit_user_path user
    page.should have_content "Edit Foo Bar's Profile"
    fill_in "Name", with: "Foo Baz"
    click_button "Save Changes"
    page.should have_content "Profile successfully updated."
    page.should have_content "Foo Baz"
    page.should_not have_content "Foo Bar"
  end
  
end