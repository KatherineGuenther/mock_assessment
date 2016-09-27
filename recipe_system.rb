require_relative 'recipe'
require_relative 'recipe_book'

# Make error class
invalid_input_error = "Please run recipe system with either the 'list' or 'display id' argument"

raise invalid_input_error if ARGV.empty?

recipe_book = RecipeBook.new
recipe_book.load_recipes("recipes.csv")

if ARGV[0] == 'list'
  recipe_book.list
elsif ARGV[0] == 'display' && ARGV[1] != nil
  recipe_book.display(ARGV[1].to_i)
else
  raise invalid_input_error
end




