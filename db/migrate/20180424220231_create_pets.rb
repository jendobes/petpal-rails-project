class CreatePets < ActiveRecord::Migration[5.2]
  def change
    create_table :pets do |t|
      t.string :name
      t.string :gender
      t.string :species
      t.string :breed
      t.integer :age
      t.text :bio
      t.integer :zip_code
      t.boolean :kill_shelter
      t.boolean :fosterer
      t.boolean :adopter
    end
  end
end
