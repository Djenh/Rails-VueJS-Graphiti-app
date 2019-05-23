require 'rails_helper'

RSpec.describe LibraryResource, type: :resource do
  describe 'creating' do
    let(:payload) do
      {
        data: {
          type: 'libraries',
          attributes: { }
        }
      }
    end

    let(:instance) do
      LibraryResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      }.to change { Library.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:library) { create(:library) }

    let(:payload) do
      {
        data: {
          id: library.id.to_s,
          type: 'libraries',
          attributes: { } # Todo!
        }
      }
    end

    let(:instance) do
      LibraryResource.find(payload)
    end

    xit 'works (add some attributes and enable this spec)' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { library.reload.updated_at }
      # .and change { library.foo }.to('bar') <- example
    end
  end

  describe 'destroying' do
    let!(:library) { create(:library) }

    let(:instance) do
      LibraryResource.find(id: library.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { Library.count }.by(-1)
    end
  end
end
