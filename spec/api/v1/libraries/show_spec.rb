require 'rails_helper'

RSpec.describe "libraries#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/libraries/#{library.id}", params: params
  end

  describe 'basic fetch' do
    let!(:library) { create(:library) }

    it 'works' do
      expect(LibraryResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq('libraries')
      expect(d.id).to eq(library.id)
    end
  end
end
