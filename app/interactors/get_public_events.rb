class GetPublicEvents 
  include Interactor

  def call
    context.fail!(error: fetch_events.error) if fetch_events.error.present?

    context.events = fetch_events.result['results'].map { |event_hash| event_hash['title'] }
  end

  def fetch_events
    @fetch_events ||= adapter.search_by_date(context.date)
  end

	def adapter
		@adapter ||= PublicEventsAdapter.new
	end
end