class AddOwnerIdColumnToRecipes < ActiveRecord::Migration[5.1]
  def change
    add_column :recipes, :owner_id, :integer
  end
end
