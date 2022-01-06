require 'rails_helper'

feature "Destroy event" do
  include_context "current user signed in"

  before do
    create :event, user: current_user
  end

  scenario "when data is valid" do

    click_on "Мои события"
    click_on "Открыть"
    
    accept_confirm do
      click_on "Destroy"
    end

    click_on "Мои события"

    expect(Event.count).to eq(0)
  end
end
