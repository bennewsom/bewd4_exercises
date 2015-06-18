require './ingredient'

class Recipe < Ingredient
    attr_accessor :title, :source_url, :social_rank, :process_search, :show_all_recipes, :dinner


    def construct_recipe_hash(title, source_url, social_rank)
        { :title => title, :source_url => source_url, :social_rank => social_rank }
    end


    def process_search(ingredient_1, ingredient_2, ingredient_3)
      rest_data = RestClient.get("http://food2fork.com/api/search?&key=bc54aade5ca8b789fe39ed0b63de8735&q=#{ingredient_1},#{ingredient_2},#{ingredient_3}&sort=r")
      json_data = JSON.parse(rest_data)
      recipes = json_data['recipes']
    self.dinner = []
        recipes.each do |recipe|
            recipe_hash = self.construct_recipe_hash(recipe['title'], recipe['source_url'], recipe['social_rank'])
            self.dinner << recipe_hash
        end
    end

    def show_all_recipes
        self.dinner.each do |recipe|
              puts "Recipe Name: #{recipe[:title]}"
              puts "Url: (#{recipe[:source_url]}"
              puts "Rank: (#{recipe[:social_rank]})"
              puts
        end
    end
end
