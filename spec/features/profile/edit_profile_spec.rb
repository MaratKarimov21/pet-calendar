require 'rails_helper'

feature "Edit profile" do
  include_context "current user signed in"

  scenario "when user signed in" do

    click_on "Мой профиль"

    expect(page).to have_content(current_user.email)
    expect(page).to have_content(current_user.firstname)
    expect(page).to have_content(current_user.lastname)

    click_on "Редактировать профиль"
    
    fill_in "Firstname", with: "New name"
    fill_in "Password", with: "123456"
    fill_in "Password confirmation", with: "123456"
    fill_in "Current password", with: "100100"

    click_on "Update"

    expect(current_user.reload.firstname).to eq("New name")
  end
end
