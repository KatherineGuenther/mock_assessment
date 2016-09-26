class Recipe
  attr_reader :id, :name, :description, :ingredients, :directions

  def initialize(args)
    @id = args[:id]
    @name = args[:name]
    @description = args[:description]
    @ingredients = args[:ingredients]
    @directions = args[:directions]
  end
end
