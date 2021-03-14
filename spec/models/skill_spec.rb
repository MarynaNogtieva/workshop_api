# frozen_string_literal: true
require 'rails_helper'

RSpec.describe Skill, type: :model do
  describe 'associations' do
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }

    it 'validates the uniqueness of the title' do
      skill1 = create(:skill)
      expect(skill1).to be_valid
      skill2 = build(:skill, name: skill1.name)
      expect(skill2).not_to be_valid
      expect(skill2.errors[:name]).to include('has already been taken')
    end
  end
end
