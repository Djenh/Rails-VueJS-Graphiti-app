require 'rails_helper'

RSpec.describe "universities#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/universities/#{university.id}"
  end

  describe 'basic destroy' do
    let!(:university) { create(:university) }

    it 'updates the resource' do
      expect(UniversityResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { University.count }.by(-1)
      expect { university.reload }
        .to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq('meta' => {})
    end
  end
end
