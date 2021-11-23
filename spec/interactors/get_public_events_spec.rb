require "rails_helper"

describe GetPublicEvents do
  let(:initial_context) { { date: date } }
  let(:interactor) { described_class.new(initial_context) }
  let(:executed_context) { described_class.call(initial_context) }
  let(:context) { interactor.context }
  let(:adapter_stub) { instance_double("PublicEventsAdapter", result: search_result, error: error) }

  before do
    allow(PublicEventsAdapter).to receive(:new).and_return(adapter_stub)
    expect(adapter_stub).to receive(:search_by_date).with(date).and_return(adapter_stub)
  end

  context "when events are found" do
    let(:error) { nil }
    let(:date) { "2021-01-01" }
    let(:search_result) { { title: "выставка" } }

    it "succeeds" do
      interactor.run

      expect(context).to be_success
      expect(context.events).to eq(search_result)
    end
  end

  context "when events are not found" do
    let(:error) { 'Events has not found' } #?
    let(:date) { nil }
    let(:search_result) { nil }

    it "failures" do
      interactor.run

      expect(context).to be_failure
      expect(context.error).to eq(error)
    end
  end
end