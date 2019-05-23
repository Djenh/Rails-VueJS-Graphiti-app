require 'rails_helper'

RSpec.describe UniversityResource, type: :resource do
  describe 'serialization' do
    let!(:university) { create(:university) }

    it 'works' do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(university.id)
      expect(data.jsonapi_type).to eq('universities')
    end
  end

  describe 'filtering' do
    let!(:university1) { create(:university) }
    let!(:university2) { create(:university) }

    context 'by id' do
      before do
        params[:filter] = { id: { eq: university2.id } }
      end

      it 'works' do
        render
        expect(d.map(&:id)).to eq([university2.id])
      end
    end
  end

  describe 'sorting' do
    describe 'by id' do
      let!(:university1) { create(:university) }
      let!(:university2) { create(:university) }

      context 'when ascending' do
        before do
          params[:sort] = 'id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            university1.id,
            university2.id
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
            university2.id,
            university1.id
          ])
        end
      end
    end
  end

  describe 'sideloading' do
    # ... your tests ...
  end
end
