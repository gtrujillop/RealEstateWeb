require 'rails_helper'

describe Operation do

  describe 'validations' do
    describe "presence validations" do
      it { should validate_presence_of(:start_date) }
      it { should validate_presence_of(:end_date) }
      it { should validate_presence_of(:payment) }
    end

    describe "relation with property model" do
      it { should belong_to(:property) }
    end
  end


  describe 'callbacks' do
    it 'sets the duration value based on start - end date ranges' do

    end
  end
end
