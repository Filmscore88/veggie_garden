class RenameGardensColumnToFarmersId < ActiveRecord::Migration
  def change
    rename_column :gardens, :user_id, :farmer_id
  end
end
