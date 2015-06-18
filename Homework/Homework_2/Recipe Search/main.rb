require 'json'
require 'rest-client'

loop do
	ingredient_1 = nil
	ingredient_2 = nil
	ingredient_3 = nil
	dinner = []

	puts 'Hello and welcome to the recipe searcher!'
	puts
	puts 'Not sure what to cook today? With this tool you can add 3 ingredients that you have laying around the house.'
	puts 'Then, our smart tool will suggest some recipes for you - too easy!'
	puts 'The recipes will be ranked in descending order from Most Popular to Least Popular for your convenience!'
	puts

	puts 'What is your first ingredient? (Text only, no numbers please!)'

	loop do
		ingredient_1 = gets.chomp.gsub(/\s+/, "")
			if ingredient_1 =~ /\d/
	  			puts "Invalid input, the ingredient '#{ingredient_1}' has a number in it. Please try again."
			else 
				break
			end
	end

	loop do
		puts 'What is your next ingredient? (Text only, no numbers please!)'
		ingredient_2 = gets.chomp.gsub(/\s+/, "")
		ingredient_2 = @ing_2
			if ingredient_2 =~ /\d/
	  			puts "Invalid input, the ingredient '#{ingredient_2}' has a number in it. Please try again."
			else 
				break
			end
	end

	loop do
		puts 'What is your first ingredient? (Text only, no numbers please!)'
		ingredient_3 = gets.chomp.gsub(/\s+/, "")
			if ingredient_3 =~ /\d/
	  			puts "Invalid input, the ingredient '#{ingredient_3}' has a number in it. Please try again."
			else 
				break
			end
	end

	puts 'Getting your suggested recipes from Food2Fork.'
	puts 'Your suggested recipes are:'

	def construct_recipe_hash(title, source_url, social_rank)
		  { :title => title, :source_url => source_url, :social_rank => social_rank }
		end

	rest_data = RestClient.get("http://food2fork.com/api/search?&key=bc54aade5ca8b789fe39ed0b63de8735&q=#{ingredient_1},#{ingredient_2},#{ingredient_3}&sort=r")
	json_data = JSON.parse(rest_data)
	recipes = json_data['recipes']
	recipes.each do |recipe|
		recipe_hash = construct_recipe_hash(recipe['title'], recipe['source_url'], recipe['social_rank'])
		dinner << recipe_hash
		end

	dinner.each do |recipe|
	  	puts "Recipe Name: #{recipe[:title]}"
	  	puts "Url: (#{recipe[:source_url]}"
	  	puts "Rank: (#{recipe[:social_rank]})"
	  	puts 
	end


	puts 'Would you like to search again? Y/N'
	proceed = gets.chomp
		if proceed == 'Y'
			'Puts great!'
		else
			puts 'Thankyou for using the recipe search tool!'
			break
		end
end
