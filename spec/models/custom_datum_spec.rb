require 'rails_helper'

RSpec.describe CustomDatum, type: :model do
  context 'when building object' do
    let(:custom_datum) { FactoryBot.build(:custom_datum, :user) }

    it 'is valid' do
      expect(custom_datum).to be_valid
    end
  end

  context 'when user fills in a custom attribute on the signup form' do
    let(:user_custom_attribute) { FactoryBot.create(:custom_attribute, :user, :boolean, name: 'free') }
    let(:params) { {email: 'free@man.com'} }
    let(:custom_params) { { custom_attribute_id: user_custom_attribute.id, content: 'true' } }

    it 'is saved in their user custom data' do
      user = User.create(params)
      custom_data = CustomDatum.create(customizable: user, **custom_params)

      expect(user.custom_data.pluck(:content)).to eq ['true']
    end
  end

  context 'when User fills in a custom attribute on his profile' do
    let(:user) { FactoryBot.create(:user) }

    let(:profile_custom_attribute) { FactoryBot.create(:custom_attribute, :profile, :text, name: 'phone') }
    let(:params) { {user_id: user.id, name: 'freeman'} }
    let(:custom_params) { { custom_attribute_id: profile_custom_attribute.id, content: '123' } }

    let(:profile) { Profile.create(params) }
    let(:custom_data) { CustomDatum.create(customizable: profile, **custom_params) }


    it 'is saves in their profile custom data' do
      expect(profile).to be_valid
      expect(custom_data).to be_valid
    end

    it 'allows user to read his custom attributes on his profile' do
      profile_custom_data = CustomDatum.where(id: custom_data)

      expect(profile.custom_data.pluck(:content)).to eq ['123']
    end
  end

  context 'when User fills in a custom attribute on an Event Registration form' do
    let(:event) { FactoryBot.create(:event) }
    let(:event_custom_attribute) { FactoryBot.create(:custom_attribute, :event, :text, name: 'date') }
    let(:params) { {event_id: event.id, email: 'free@man.com' } }
    let(:custom_params) { { custom_attribute_id: event_custom_attribute.id, content: '01/01/2020' } }

    let(:registration) { EventRegistration.create(params) }
    let(:custom_data) { CustomDatum.create(customizable: registration, **custom_params) }

    it 'is saves in their registration custom data' do
      expect(registration).to be_valid
      expect(custom_data).to be_valid
    end

    it 'allows admin to read an Event registration’s custom attributes' do
      reg_custom_data = CustomDatum.where(id: custom_data)

      expect(reg_custom_data.pluck(:content)).to eq ['01/01/2020']
    end
  end
end
