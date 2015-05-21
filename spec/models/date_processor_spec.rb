require 'rails_helper'

describe 'DateProcessor' do
  describe '#months_between' do
    it 'calculates the months range given a date' do
      processor = DateProcessor.new(Date.today)
      future_date = Date.today + 12.months
      expect(processor.months_between(future_date)).to eq(12)
    end
    it 'returns 0 when future date is lesser than date' do
      processor = DateProcessor.new(Date.today + 12.months)
      future_date = Date.today
      expect(processor.months_between(future_date)).to eq(0)
    end
  end
end
