require 'rails_helper'

RSpec.describe UniversityResource, type: :resource do
  describe 'creating' do
    let(:payload) do
      {
        data: {
          type: 'universities',
          attributes: { }
        }
      }
    end

    let(:instance) do
      UniversityResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      }.to change { University.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:university) { create(:university) }

    let(:payload) do
      {
        data: {
          id: university.id.to_s,
          type: 'universities',
          attributes: { } # Todo!
        }
      }
    end

    let(:instance) do
      UniversityResource.find(payload)
    end

    xit 'works (add some attributes and enable this spec)' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { university.reload.updated_at }
      # .and change { university.foo }.to('bar') <- example
    end
  end

  describe 'destroying' do
    let!(:university) { create(:university) }

    let(:instance) do
      UniversityResource.find(id: university.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { University.count }.by(-1)
    end
  end
end
