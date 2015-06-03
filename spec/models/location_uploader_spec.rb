require 'rails_helper'
require 'csv'
describe LocationUploader do
  describe '#import_locations' do
    context 'with the correct file and data' do
      it 'generates a Location for each row in the file' do
        csv_file = File.join(RAILS_ROOT, 'tmp', 'locations.csv')
        uploader = LocationUploader.new(csv_file)
        uploader.import_locations
        expect(Location.last.address).to eq 'Bolivariana 66B # 34-76, Medellín, Colombia'
      end
    end
  end
end
