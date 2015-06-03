require 'csv'
class LocationUploader
  attr_accessor :errors

  def initialize(csv_file_path)
    @csv_file_path = csv_file_path
    self.errors = []
  end

  def import_locations
    CSV.foreach(@csv_file_path, headers: true, :col_sep => ";", :skip_blanks => true) do | row |
      location = Location.new(row.to_hash)
      errors << location.errors.full_messages.join(',') unless location.save
    end
  end

  def successful?
    errors.empty?
  end
end
