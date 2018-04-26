class CreateRescues < ActiveRecord::Migration[5.2]
  def change
    create_table :rescues do |t|
      t.integer :owner_id
      t.integer :pet_id
      t.text :story
      t.boolean :adoption
    end
  end
end
