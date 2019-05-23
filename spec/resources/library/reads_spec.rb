require 'rails_helper'

RSpec.describe LibraryResource, type: :resource do
  describe 'serialization' do
    let!(:library) { create(:library) }

    it 'works' do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(library.id)
      expect(data.jsonapi_type).to eq('libraries')
    end
  end

  describe 'filtering' do
    let!(:library1) { create(:library) }
    let!(:library2) { create(:library) }

    context 'by id' do
      before do
        params[:filter] = { id: { eq: library2.id } }
      end

      it 'works' do
        render
        expect(d.map(&:id)).to eq([library2.id])
      end
    end
  end

  describe 'sorting' do
    describe 'by id' do
      let!(:library1) { create(:library) }
      let!(:library2) { create(:library) }

      context 'when ascending' do
        before do
          params[:sort] = 'id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            library1.id,
            library2.id
          ])
        end
      end

      context 'when descending' do
        before do
          params[:sort] = '-id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            library2.id,
            library1.id
          ])
        end
      end
    end
  end

  describe 'sideloading' do
    # ... your tests ...
  end
end
