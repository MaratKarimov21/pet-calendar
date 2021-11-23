require 'httparty'

class PublicEventsAdapter
  include HTTParty

  base_uri "https://kudago.com"
  
  attr_reader :result, :error

  def search_by_date(date)
    response = self.class.get("/public-api/v1.2/events/", search_options(date))
    
    result = if response.success?
      response.parsed_response["results"].map { |event_hash| event_hash["title"] }
    else
      response.parsed_response.dig("message")
    end

    result
  end

  private

  def search_options(date)
    {
      query: {
        location: "kzn",
        actual_since: formatted_datetime(date),
        actual_until: formatted_datetime(date),
        is_free: 1,
        fields: "title"
      }
    }
  end

  def formatted_datetime(date)
    DateTime.parse(date).to_s
  end
end