FactoryBot.define do
  factory :event do
    date { Date.today }
    body { Faker::Lorem.sentence }
  end
end