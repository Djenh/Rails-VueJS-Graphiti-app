require 'rails_helper'

RSpec.describe "universities#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/universities", params: params
  end

  describe 'basic fetch' do
    let!(:university1) { create(:university) }
    let!(:university2) { create(:university) }

    it 'works' do
      expect(UniversityResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(['universities'])
      expect(d.map(&:id)).to match_array([university1.id, university2.id])
    end
  end
end
