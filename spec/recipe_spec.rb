require_relative "../recipe"

describe Recipe do
  it 'creates a new instance of class Recipe' do
    expect(Recipe.new({id: 4, description: 'Cheesecake', ingredients: 'none', directiosn: 'bake'})).to be_a(Recipe)
  end
end
