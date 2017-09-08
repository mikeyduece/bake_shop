require 'csv'
require './app/models/ingredient'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
ingredients = CSV.foreach './db/ingredient_list.csv', headers: true, header_converters: :symbol
ingredients.each do |row|
  row = row.to_h
  Ingredient.create!(row)
end