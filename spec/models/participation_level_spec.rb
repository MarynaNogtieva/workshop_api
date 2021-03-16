require 'rails_helper'

RSpec.describe ParticipationLevel, type: :model do
  describe 'associations' do
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }

    it 'validates the uniqueness of the title' do
      participation_level1 = create(:participation_level)
      expect(participation_level1).to be_valid
      participation_level2 = build(:participation_level, name: participation_level1.name)
      expect(participation_level2).not_to be_valid
      expect(participation_level2.errors[:name]).to include('has already been taken')
    end
  end
end
