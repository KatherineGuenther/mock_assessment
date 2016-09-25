require_relative "../recipe_book.rb"

describe RecipeBook do
  let (:recipe_book) {RecipeBook.new()}

  describe '#read_file' do
    it 'reads a csv file of recipes and creates an array of hashes' do
      expect(recipe_book.read_file('recipes.csv').first).to be_a(CSV::Row)
    end
  end

  describe '#load_recipes' do
    it 'reads a csv file of recipes and creates an array of recipe instances' do
      recipe_book.load_recipes('recipes.csv')
      expect((recipe_book.recipes).count).to eq(3)
    end
  end

  describe "#find_recipe_by_id" do
    it 'finds a recipe by id' do
      recipe_book.load_recipes('recipes.csv')
      p recipe_book.recipes
      expect(recipe_book.find_recipe_by_id(111)).to be_a(Recipe)
            p recipe_book.recipes

    end

    it "raises an exception if it can't find a recipe" do
      expect { recipe_book.find_recipe_by_id(504)}.to raise_error
    end
  end
  
end
