# frozen_string_literal: true

FactoryBot.define do
  factory :participation_level do
    sequence(:name) { |n| "ParticipationLevel#{n}" }
  end
end
