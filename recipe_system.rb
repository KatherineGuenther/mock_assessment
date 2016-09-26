require_relative 'recipe'
require_relative 'recipe_book'


if ARGV.empty? || (ARGV[0] == 'display' && ARGV[1] == nil) || ARGV[0] != 'list'
  raise "Please run recipe system with either the 'list' or 'display id' argument" 
end

recipe_book = RecipeBook.new
recipe_book.load_recipes("recipes.csv")

if ARGV[0] == 'list'
  recipe_book.list
else
  recipe_book.display(ARGV[1])
end



