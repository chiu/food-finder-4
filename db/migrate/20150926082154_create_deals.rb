class CreateDeals < ActiveRecord::Migration
  def change
    create_table :deals do |t|
      t.references :diner, index: true, foreign_key: true
      t.string :name
      t.integer :old_price
      t.integer :new_price
      t.datetime :offer_start
      t.datetime :offer_end
      t.datetime :pickup_start
      t.datetime :pickup_end
      t.text :description

      t.timestamps null: false
    end
  end
end
