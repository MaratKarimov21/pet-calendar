require 'rails_helper'

feature "Create event" do
  include_context "current user signed in"

  scenario "when data is valid" do
    click_on "Новое событие"

    fill_in "Date", with: Date.current.to_s
    fill_in "Body", with: "Test Event"
  
    click_on "Create Event"
  
    expect(page).to have_content("Test Event")
    expect(page).to have_link("Destroy")
  
    click_on "Мои события"
  
    expect(page).to have_content("Test Event")
  end

  scenario "when data is invalid" do
    click_on "Новое событие"

    fill_in "Date", with: nil
    fill_in "Body", with: nil
  
    click_on "Create Event"
  
    expect(page).to have_content("Date can't be blank")
    expect(page).to have_content("Body can't be blank")
  end
end
