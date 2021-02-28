class Workshop < ApplicationRecord
  validates :title, :short_description, presence: true
  validates :title, uniqueness: true
end
