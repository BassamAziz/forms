require 'rails_helper'

RSpec.describe CustomAttribute, type: :model do
  let(:custom_attribute) { FactoryBot.build(:custom_attribute) }
  let(:user_custom_attribute) { FactoryBot.build(:custom_attribute, :user) }
  let(:profile_custom_attribute) { FactoryBot.build(:custom_attribute, :profile) }
  let(:event_reg_custom_attribute) { FactoryBot.build(:custom_attribute, :event) }

  context 'when building object' do
    it 'is valid' do
      expect(custom_attribute).to be_valid
    end

    it 'is a boolean attribute' do
      boolean_attr = FactoryBot.build(:custom_attribute, :boolean)

      expect(boolean_attr.data_type).to eq 'boolean'
    end

    it 'is a text attribute' do
      text_attr = FactoryBot.build(:custom_attribute, :text)

      expect(text_attr.data_type).to eq 'text'
    end
  end

  context 'when creating a new custom attribute' do
    it 'creates a user custom attribute' do
      expect(user_custom_attribute).to be_valid
      expect(user_custom_attribute.source).to eq 'user'
    end

    it 'creates a profile custom attribute' do
      expect(profile_custom_attribute).to be_valid
      expect(profile_custom_attribute.source).to eq 'profile'
    end

    it 'creates an event registration custom attribute' do
      expect(event_reg_custom_attribute).to be_valid
      expect(event_reg_custom_attribute.source).to eq 'event_registration'
    end
  end

  context 'when editing an existing custom attribute' do
    let(:required) { FactoryBot.build(:custom_attribute, required: true) }
    let(:unrequired) { FactoryBot.build(:custom_attribute, required: false) }
    let(:require) { unrequired.update(required: true) }
    let(:unrequire) { required.update(required: false) }

    it 'updates a custom attribute to be required' do
      expect{require}.to change{unrequired.required}.from(false).to(true)
    end

    it 'updates a custom attribute to be not required ' do
      expect{unrequire}.to change{required.required}.from(true).to(false)
    end
  end
end
