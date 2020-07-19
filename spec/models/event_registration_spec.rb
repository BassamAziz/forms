require 'rails_helper'

RSpec.describe EventRegistration, type: :model do
  context 'when building object' do
    let(:registration) { FactoryBot.build(:event_registration) }

    it 'is valid' do
      expect(registration).to be_valid
    end
  end
end
