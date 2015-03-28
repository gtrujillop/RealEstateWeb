class CountriesWithCitiesGrouper
	Cities.data_path = Rails.root.join('config', 'extras', 'cities')
	attr_accessor :region

	def initialize(region)
		self.region = region		
	end

	def countries_by_region
		@countries ||= Country.find_all_countries_by_region(region)		
	end

	def cities_by_country
		@cities_by_country ||= countries_by_region.each_with_object({}) do |country, memo|
			memo[country.name] = city_names(country)
		end
	end

	def cities_for(country)
		cities_by_country["#{country.capitalize}"]
	end

	def city_names(country)
		names = []
		country.cities.keys.each do |name|
			names << name.split.map(&:capitalize).join(' ')
		end
		names
	end
	private :city_names

end