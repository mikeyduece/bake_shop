class CreateRecipeIngredients < ActiveRecord::Migration[5.1]
  def change
    create_table :recipe_ingredients do |t|
      t.float :amount
      t.references :recipe, index: true, foreign_key: true
      t.references :ingredient, index: true, foreign_key: true

      t.timestamps
    end
  end
end
