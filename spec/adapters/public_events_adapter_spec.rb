require "rails_helper"

describe PublicEventsAdapter do
  describe "#search_by_date" do
    subject(:search_by_date) { adapter.search_by_date(date) }

    let(:adapter) { described_class.new }
    let(:date) { "2021-01-01" }
    let(:data) { { title: "test"  } }
    let(:url) { "https://kudago.com/public-api/v1.2/events/?location=kzn&actual_since=2021-01-01T00:00:00+00:00&actual_until=2021-01-01T00:00:00+00:00&is_free=1&cfields=title" }


    before do
      stub_request(:get, url).to_return(body: data.to_json, headers: { "Content-Type" => "application/json" })
    end

    it "fetches events info via API" do
      expect(search_by_date.result["title"]).to eq("test")
    end
  end
end