require 'rails_helper'

RSpec.describe Profile, type: :model do
  context 'when building object' do
    let(:profile) { FactoryBot.build(:profile) }

    it 'is valid' do
      expect(profile).to be_valid
    end
  end
end