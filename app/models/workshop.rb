# frozen_string_literal: true
class Workshop < ApplicationRecord
  validates :title, :short_description, presence: true
  validates :title, uniqueness: true
  scope :recent, -> {order(created_at: :desc)}
end
