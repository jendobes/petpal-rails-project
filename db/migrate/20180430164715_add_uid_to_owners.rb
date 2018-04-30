class AddUidToOwners < ActiveRecord::Migration[5.2]
  def change
    add_column :owners, :uid, :integer
  end
end
