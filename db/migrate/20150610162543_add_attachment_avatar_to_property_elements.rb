class AddAttachmentAvatarToPropertyElements < ActiveRecord::Migration
  def self.up
    change_table :property_elements do |t|
      t.attachment :avatar
    end
  end

  def self.down
    remove_attachment :property_elements, :avatar
  end
end
