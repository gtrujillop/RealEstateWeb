require 'rails_helper'

describe CountriesWithCitiesGrouper do

  describe '#countries_by_region' do
    it 'returns a hash with countries given a region' do
      countries_with_cities_grouper = CountriesWithCitiesGrouper.new('Americas')
      expect(countries_with_cities_grouper.countries_by_region).to be_an(Array)
    end
  end

  describe '#cities_by_country' do
    it 'returns an array of cities grouped by country name' do
      countries_with_cities_grouper = CountriesWithCitiesGrouper.new('Americas')
      expect(countries_with_cities_grouper.cities_by_country).to be_a(Hash)
    end
    it 'returns capitalized city name' do
      countries_with_cities_grouper = CountriesWithCitiesGrouper.new('Americas')
      cities = countries_with_cities_grouper.cities_by_country
      expect(cities['Colombia']).to include('Cartagena')
    end
  end

  describe '#cities_for' do
    it 'returns cities for a given country' do
      countries_with_cities_grouper = CountriesWithCitiesGrouper.new('Americas')
      expect(countries_with_cities_grouper.cities_for('Colombia')).to be_an(Array)
      expect(countries_with_cities_grouper.cities_for('Colombia')).to include('Medellin')
    end
  end
end
