require 'rails_helper'

RSpec.describe Workshop, type: :model do
  describe 'associations' do
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:short_description) }
  end
end
