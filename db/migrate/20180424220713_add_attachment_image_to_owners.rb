class AddAttachmentImageToOwners < ActiveRecord::Migration[5.2]
  def self.up
    change_table :owners do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :owners, :image
  end
end
