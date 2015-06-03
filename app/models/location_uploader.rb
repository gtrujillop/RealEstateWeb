require 'csv'
class LocationUploader
  def initialize(csv_file)
    @csv_file = csv_file
  end

  def import_locations
    CSV.foreach(@csv_file, headers: true, :col_sep => ";", :skip_blanks => true) do | row |
      Location.create!(row.to_hash)
    end
  end
end
