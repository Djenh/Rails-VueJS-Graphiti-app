require 'rails_helper'

RSpec.describe "libraries#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/libraries/#{library.id}", payload
  end

  describe 'basic update' do
    let!(:library) { create(:library) }

    let(:payload) do
      {
        data: {
          id: library.id.to_s,
          type: 'libraries',
          attributes: {
            # ... your attrs here
          }
        }
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit 'updates the resource' do
      expect(LibraryResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { library.reload.attributes }
    end
  end
end
