require 'rails_helper'

RSpec.describe "universities#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/universities/#{university.id}", params: params
  end

  describe 'basic fetch' do
    let!(:university) { create(:university) }

    it 'works' do
      expect(UniversityResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq('universities')
      expect(d.id).to eq(university.id)
    end
  end
end
