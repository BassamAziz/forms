require 'rails_helper'

RSpec.describe Event, type: :model do
  context 'when building object' do
    let(:event) { FactoryBot.build(:event) }

    it 'is valid' do
      expect(event).to be_valid
    end
  end
end
