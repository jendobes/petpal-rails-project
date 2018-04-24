class CreateOwners < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.text :bio
      t.boolean :adopter
      t.boolean :fosterer
      t.integer :zip_code
      t.string :password_digest
      t.string :email
    end
  end
end
