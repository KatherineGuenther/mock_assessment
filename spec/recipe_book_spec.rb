require_relative "../recipe_book.rb"

describe RecipeBook do
  let (:recipe_book) {RecipeBook.new()}

  # describe "#find_recipe_by_id" do
  #   xit 'finds a recipe by id' do
  #   end

  #   xit "raises an exception if it can't find a recipe" do
  #     #How do I check exceptions? Here's an example
  #     # expect { my_thing.method_that_raises }.to raise_error
  #   end

  describe 'read_file' do
    it 'reads a csv file of recipes and creates an array of hashes' do
      expect(recipe_book.read_file('recipes.csv').first).to be_a(CSV::Row)
    end
  end

  describe 'load_recipes' do
    it 'reads a csv file of recipes and creates an array of hashes' do
      recipe_book.load_recipes('recipes.csv')
      expect((recipe_book.recipes).count).to eq(3)
    end
  end

end
