require 'rails_helper'
describe OperationPresenter do
  let!(:lease_holder) { create(:lease_holder) }
  let!(:property) { create(:property, lease_holder: lease_holder) }

  describe '#user_properties' do
    context 'when user has properties' do
      it 'retreives all related properties' do
        presenter = OperationPresenter.new(lease_holder)
        result = presenter.user_properties
        expect(result.size).to eq(1)
        expect(result.first).to be_a(Property)
        expect(result.first.building_name).to eq(property.building_name)
      end
    end
    context 'when user does not has properties' do
      it 'retreives an empty array' do
        other_lease_holder = create(:lease_holder, id: 100)
        presenter = OperationPresenter.new(other_lease_holder)
        result = presenter.user_properties
        expect(result.size).to eq(0)
      end
    end
  end

  describe '#address_from_properties' do
    it 'retreives the address from each property' do
      presenter = OperationPresenter.new(lease_holder)
      result = presenter.address_from_properties
      expect(result).to be_an(Array)
      expect(result.first).to eq([property.address, property.id])
    end
  end
end
