require 'httparty'

class PublicEventsAdapter
  include HTTParty

  base_uri 'https://kudago.com'
  
  attr_reader :result, :error

  def search_by_date(date)
    response = self.class.get("/public-api/v1.2/events/", options(date))
    
    if response.success?
      @result = response.parsed_response
    else
      @error = response.parsed_response.dig("message")
    end

    self
  end

  def options(date)
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

  def fetch_date(date)
    fetched_date = DateTime.parse(date).to_s
  end
end