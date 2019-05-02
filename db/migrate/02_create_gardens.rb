class CreateGardens < ActiveRecord::Migration
  def change
    create_table :gardens do |t|
      t.string :name
      t.string :planting_system
      t.integer :user_id
    end

  end
end
