require "rails_helper"

describe PublicEventsAdapter do
  describe "#search_by_date" do
    subject(:search_by_date) { adapter.search_by_date(date) }

    let(:date) { "2021-01-01" }


    let(:data) { { title: "test"  } }
    let(:url) { "https://kudago.com/public-api/v1.2/events/" }

    let(:search_options) do
      {
        query: {
          location: 'kzn',
          actual_since: fetch_date(date),
          actual_until: fetch_date(date),
          is_free: 1,
          fields: 'title'
        }
      }
    end

    before do
      # stub_request(:get, url).to_return(body: data.to_json, headers: { "Content-Type" => "application/json" })

      allow(HTTParty).to receive(:get).with("/public-api/v1.2/events/", search_options)
    end

    it "fetches events info via API" do
      expect(search_by_date.result["title"]).to eq("test")
    end
  end
end