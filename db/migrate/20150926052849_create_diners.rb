class CreateDiners < ActiveRecord::Migration
  def change
    create_table :diners do |t|
      t.string :email
      t.string :password_digest
      t.string :name
      t.string :location
      t.text :description
      t.integer :rating

      t.timestamps null: false
    end
  end
end
