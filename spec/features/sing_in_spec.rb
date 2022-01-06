require 'rails_helper'

feature "Sign In" do

  background do
    create :user, email: "test@test.com", password: "100100", firstname: "test", lastname: "test"
  end

  scenario "Visitor Sign in with valid credentials" do
    sign_in("test@test.com", "100100")

    expect(page).to have_content(Date.current.year.to_s)
    expect(page).to have_content(Date.current.month.to_s)
  end

  scenario "Visitor Sign in with invalid credentials" do
    sign_in("test@test.com", "wrong password")

    expect(page).to have_content("Sign up")
  end
end
