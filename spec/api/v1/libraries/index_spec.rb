require 'rails_helper'

RSpec.describe "libraries#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/libraries", params: params
  end

  describe 'basic fetch' do
    let!(:library1) { create(:library) }
    let!(:library2) { create(:library) }

    it 'works' do
      expect(LibraryResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(['libraries'])
      expect(d.map(&:id)).to match_array([library1.id, library2.id])
    end
  end
end
