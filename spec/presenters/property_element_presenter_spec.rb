require 'rails_helper'
describe PropertyElementPresenter do
  let!(:property) { create(:property) }

  describe '#property' do
    context 'when the property exist' do
      it 'retreives the property from the initialized id' do
        presenter = PropertyElementPresenter.new(property.id)
        result = presenter.property
        expect(result).to eq(property)
      end
    end
    end

  describe '#types_id_by_name' do
    let!(:element_type) { create(:element_type) }
    it 'retrevies the ElementType id by name' do
      presenter = PropertyElementPresenter.new(property.id)
      result = presenter.types_id_by_name
      expect(result).to eq({ "Habitaciones" => element_type.id })
    end
  end

  describe '#types_for_property' do

    let(:bath_room_element_type) { create(:element_type, name: 'Baños') }
    let(:bed_room_element_type) { create(:element_type, name: 'Habitaciones') }
    let!(:bath_room) { create(:property_element, name: 'Baño Principal', element_type: bath_room_element_type, property: property)}
    let!(:bed_room) { create(:property_element, name: 'Alcoba Principal', element_type: bed_room_element_type, property: property)}
    let!(:bed_room_1) { create(:property_element, name: 'Alcoba Auxiliar', element_type: bed_room_element_type, property: property)}

    it 'retrevies the ElementType count for the property' do
      presenter = PropertyElementPresenter.new(property.id)
      result = presenter.types_for_property
      expect(result).to eq({ "Habitaciones" => 2, "Baños" => 1 })
    end
  end
end
