class CreateFosters < ActiveRecord::Migration[5.2]
  def change
    create_table :fosters do |t|
      t.integer :owner_id
      t.integer :pet_id
      t.text :story
    end
  end
end
