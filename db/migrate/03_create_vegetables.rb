class CreateVegetables < ActiveRecord::Migration
  def change
    create_table :vegetables do |t|
      t.string :name
      t.integer :garden_id
    end
  end
end
