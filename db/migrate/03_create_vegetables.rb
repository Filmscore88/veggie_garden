class CreateVegetables < ActiveRecord::Migration
  def change
    create_table :vegetables do |t|
      t.string :name
      t.integer :garden_id
      t.integer :quantity
    end
  end
end
