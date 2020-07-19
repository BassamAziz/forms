require 'rails_helper'

RSpec.describe User, type: :model do
  context 'when building object' do
    let(:user) { FactoryBot.create(:user) }

    it 'is valid' do
      expect(user).to be_valid
    end
  end
end
