require 'rails_helper'

describe Operation do

  describe 'validations' do
    describe "presence validations" do
      it { should validate_presence_of(:start_date) }
      it { should validate_presence_of(:end_date) }
      it { should validate_presence_of(:payment) }
    end

    describe "date validations" do

    end

    describe "relation with property model" do
      it { should belong_to(:property) }
    end
  end


  describe 'callbacks' do
    it 'sets the duration value based on start - end date ranges' do
      operation = Operation.new({start_date: Date.today, end_date: 12.months.from_now.to_date, payment: 1000})
      operation.save
      expect(operation.duration).to eq('12 months')
    end
    it 'sets the is_active value as active after save' do
      operation = Operation.new({start_date: Date.today, end_date: 12.months.from_now.to_date, payment: 1000})
      operation.save
      expect(operation.is_active).to eq(true)
    end
  end
end
