class AddAttachmentImageToPropertyElements < ActiveRecord::Migration
  def self.up
    change_table :property_elements do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :property_elements, :image
  end
end
