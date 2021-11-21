require "rails_helper"

describe Event do
    let(:user) { build :user }
    let(:event) { build(:user, user_id: user.id) }

    describe "#valid?" do
        it { expect(event.valid?).to be_truthy }

        context "when date field is empty" do
            let(:date) { nil }
            let(:expected_errors) { "Date can't be blank" }

            it "validates event" do
                expect(event.valid?).to be_falsey
                expect(event.errors.full_messages).to eq(expected_errors)
            end
        end

        context "when body field is empty" do
            let(:body) { nil }
            let(:expected_errors) { "Body can't be blank" }

            it "validates event" do
                expect(event.valid?).to be_falsey
                expect(event.errors.full_messages).to eq(expected_errors)
            end
        end
    end
end