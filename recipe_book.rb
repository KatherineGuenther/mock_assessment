require 'csv'
require_relative 'recipe.rb'

class RecipeBook
  attr_reader :recipes

  def initialize
    @recipes = []
  end

  def read_file(filename)
    array_of_rows = []
    rows = CSV.readlines(filename, { headers: true, converters: :numeric, header_converters: :symbol })
    rows.each { |row| array_of_rows << row }
    array_of_rows
  end

  def load_recipes(filename)
    recipes = read_file(filename)
    recipes.each { |recipe| @recipes << Recipe.new(recipe) }
  end

  def find_recipe_by_id(recipe_id)
    p @recipes
    @recipes.each do |recipe|
      p recipe.id
      p recipe.id.class
      return recipe if recipe.id == recipe_id
  end

    raise "Can't find a recipe with an id of #{recipe_id}"
  end

end

 recipe_book = RecipeBook.new()
 recipe_book.load_recipes('recipes.csv')