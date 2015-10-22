require 'rails_helper'
describe PropertyPresenter do

  describe '#filter_properties' do

    context 'when is a basic filter' do
      let(:params) { {  } }

      it 'filters with coordinates params' do
        property = create(:property)
        results = PropertyPresenter.new(params).filter_properties
        expect(results).to eq([property])
      end
    end
    context 'when is filtering by map' do
      let(:property) do
        create(:property, latitude: 45.89, longitude: 6.45)
      end

      let(:params) { { "latitude" => property.latitude,
                       "longitude" => property.longitude, "for_sell" => "1",
                       "located_in" => "", "area_greater_than" => "0",
                       "area_lesser_than" => "0", "value_greater_than" => "0",
                       "value_lesser_than" => "0" } }

      it 'filters with coordinates params' do
        results = PropertyPresenter.new(params).filter_properties
        expect(results.first).to eq(property)
      end
    end
    context 'when is filtering by fields' do
      let(:property) do
        create(:property, address: 'Centro Comercial El Tesoro, Medellín, Colombia')
      end
      let(:params) { { "latitude" => "", "longitude" => "",
                       "for_sell" => "0", "located_in" => "Medellín",
                       "area_greater_than" => "50", "area_lesser_than" => "200",
                       "value_greater_than" => "100000",
                       "value_lesser_than" => "2000000" } }

      it 'filters with fields params' do
        pending('The property factory is not setting the data')
        results = PropertyPresenter.new(params).filter_properties
        expect(results.first).to eq(property)
      end
    end
    end

end
