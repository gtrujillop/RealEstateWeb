require 'rails_helper'
describe OperationPresenter do
  describe '.user_properties' do
    let!(:lease_holder) { create(:lease_holder) }
    let!(:property) { create(:property, lease_holder: lease_holder) }
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
end
