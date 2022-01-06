require 'rails_helper'

feature "Edit event" do
  include_context "current user signed in"

  let!(:event) { create :event, user: current_user }

  scenario "when data is valid" do

    click_on "Мои события"
    click_on "Открыть"
    click_on "Edit"

    fill_in "Body", with: "Updated body"

    click_on "Update Event"

    expect(event.reload.body).to eq("Updated body")
  end
end
