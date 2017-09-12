class Recipe < ApplicationRecord
  has_many :recipe_ingredients, dependent: :destroy
  has_many :ingredients, through: :recipe_ingredients
  accepts_nested_attributes_for :recipe_ingredients
  
  has_many :user_recipes, dependent: :destroy
  has_many :users, through: :user_recipes
  
  belongs_to :owner, class_name: 'User', foreign_key: 'owner_id'
  
  def recipe_ingredient
    RecipeIngredient.where(recipe_id: id)
  end
  
  def self.owned_recipes(id)
    where(owner_id: id)
  end
  
  def flours_amt(id)
    RecipeIngredient.select('ingredients.name')
      .joins(:ingredient)
      .where(recipe_id: id)
      .where('ingredients.name like ?', '%Flour%')
      .sum(:amount)
  end
end
