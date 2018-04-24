class CreateAdoptions < ActiveRecord::Migration[5.2]
  def change
    create_table :adoptions do |t|
      t.integer :owner_id
      t.integer :pet_id
      t.text :story
    end
  end
end
