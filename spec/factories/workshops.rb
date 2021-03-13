# frozen_string_literal: true
FactoryBot.define do
  factory :workshop do
    sequence(:title) { |n| "MyTitle #{n}" }
    short_description { 'MyText' }
    long_description { 'MyText' }
  end
end
