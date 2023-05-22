require 'faker'

FactoryBot.define do
  factory :link do
    title { 'テスト' }
    url { Faker::Internet.url }

    trait :invalid do
      title { nil }
    end
  end
end
