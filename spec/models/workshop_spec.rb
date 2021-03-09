require 'rails_helper'

RSpec.describe Workshop, type: :model do
  describe 'associations' do
  end

  describe 'validations' do
    context 'app_level' do
      it { is_expected.to validate_presence_of(:title) }
      it { is_expected.to validate_presence_of(:short_description) }

      it 'validates the uniqueness of the title' do
        workshop1 = create(:workshop)
        expect(workshop1).to be_valid
        workshop2 = build(:workshop, title: workshop1.title)
        expect(workshop2).not_to be_valid
        expect(workshop2.errors[:title]).to include('has already been taken')
      end

      it 'throws an error if a title or dscription are blank' do
        expect { create(:workshop, title: '', short_description: '') }.to raise_error(ActiveRecord::RecordInvalid)
      end
    end
  end

  describe '.recent' do
    it 'returns articles in the correct order' do
      recent_workshop = create(:workshop)
      older_workshop = create(:workshop, created_at: 1.hour.ago)

      expect(described_class.recent).to eq([recent_workshop, older_workshop])

      recent_workshop.update_column(:created_at, 2.hours.ago)
      expect(described_class.recent).to eq([older_workshop, recent_workshop])
    end
  end
end
