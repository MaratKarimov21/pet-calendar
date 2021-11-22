require "rails_helper"

describe FilteredEventsQuery do
  subject(:query) { described_class.new(events, filter_params).all }

  let(:events) { Event.all }
  let(:filter_params) { {} }
  let!(:event1) { create :event, date: "2021-01-01" }
  let!(:event2) { create :event, date: "2021-01-15" }
  let!(:event3) { create :event, date: "2021-01-30" }

  describe "#all" do
    subject(:all) { query.all }

    it { is_expected.to match_array([event1, event2, event3]) }
  end

  describe "#by_date" do
    let(:filter_params) { { date: "2021-01-15" } }

    it { is_expected.to match_array([event2]) }

    context "when there is no events on this date" do
      let(:filter_params) { { date: "2021-01-12" } }

      it { is_expected.to match_array([]) }
    end
  end

  describe "#by_date_from" do
    let(:filter_params) { { date_from: "2021-01-14" } }

    it { is_expected.to match_array([event2, event3]) }
  end

  describe "#by_date_until" do
    let(:filter_params) { { date_until: "2021-01-16" } }

    it { is_expected.to match_array([event1, event2]) }
  end
end