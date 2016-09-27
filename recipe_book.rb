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
    @recipes.each { |recipe| return recipe if recipe.id == recipe_id }
    raise "Can't find a recipe with an id of #{recipe_id}"
  end

  # Create seperate view class for list and display
  def display(id)
    recipe = find_recipe_by_id(id)
    puts "Recipe #{recipe.id} - #{recipe.name}"
    puts recipe.description
    puts "\nIngredients:\n"
    puts recipe.ingredients
    puts "\nPreparation Instructions"
    puts recipe.directions
  end

  # Create seperate view class for list and display
  def list
    @recipes.each {|recipe| puts "#{recipe.id} - #{recipe.name}"}
  end

end
