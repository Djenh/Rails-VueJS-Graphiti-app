require 'rails_helper'

RSpec.describe "libraries#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/libraries/#{library.id}"
  end

  describe 'basic destroy' do
    let!(:library) { create(:library) }

    it 'updates the resource' do
      expect(LibraryResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { Library.count }.by(-1)
      expect { library.reload }
        .to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq('meta' => {})
    end
  end
end
