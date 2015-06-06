require 'rails_helper'
require 'csv'
describe LocationUploader do
  describe '#import_locations' do
    context 'with the correct file and data' do
      it 'generates a Location for each row in the file' do
        csv_file = File.join(RAILS_ROOT, 'public', 'locations.csv')
        uploader = LocationUploader.new(csv_file)
        uploader.import_locations
        expect(Location.last.address).to eq 'Bolivariana 66B # 34-76, Medellín, Colombia'
      end
    end

    context 'with the correct file and incorrect data' do
      it 'sets an invalid operation adding the errors' do
        csv_file = File.join(RAILS_ROOT, 'public', 'locations_wrong.csv')
        uploader = LocationUploader.new(csv_file)
        uploader.import_locations
        expect(uploader.errors).to_not be_empty
      end
    end
  end

  describe '#successful?' do
    context 'with the correct file and data' do
      it 'returns true' do
        csv_file = File.join(RAILS_ROOT, 'public', 'locations.csv')
        uploader = LocationUploader.new(csv_file)
        uploader.import_locations
        expect(uploader.successful?).to be_truthy
      end
    end

    context 'with the correct file and incorrect data' do
      it 'returns false' do
        csv_file = File.join(RAILS_ROOT, 'public', 'locations_wrong.csv')
        uploader = LocationUploader.new(csv_file)
        uploader.import_locations
        expect(uploader.successful?).to be_falsey
      end
    end
  end
end
