class Workshop < ApplicationRecord
  validates :title, presence: true
  validates :short_description, presence: true
end
