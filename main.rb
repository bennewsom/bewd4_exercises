require 'json'
require 'rest-client'
require './recipe'
require './ingredient'

recipe = Recipe.new

loop do
    puts 'Hello and welcome to the recipe searcher!'
    puts
    puts 'Not sure what to cook today? With this tool you can add 3 ingredients that you have laying around the house.'
    puts 'Then, our smart tool will suggest some recipes for you - too easy!'
    puts 'The recipes will be ranked in descending order from Most Popular to Least Popular for your convenience!'
    puts

    puts 'What is your first ingredient? (Text only, no numbers please!)'

  ingredient_1 = nil
  ingredient_2 = nil
  ingredient_3 = nil

    loop do
        ingredient_1 = gets.chomp.gsub(/\s+/, "")
        if ingredient_1 =~ /\d/
              puts "Invalid input, the ingredient '#{ingredient_1}' has a number in it. Please try again."
        else
            break
        end
    end

    loop do
        puts 'What is your second ingredient? (Text only, no numbers please!)'
        ingredient_2 = gets.chomp.gsub(/\s+/, "")
        if ingredient_2 =~ /\d/
                  puts "Invalid input, the ingredient '#{ingredient_2}' has a number in it. Please try again."
        else
            break
        end
    end

    loop do
        puts 'What is your final ingredient? (Text only, no numbers please!)'
        ingredient_3 = gets.chomp.gsub(/\s+/, "")
        if ingredient_3 =~ /\d/
              puts "Invalid input, the ingredient '#{ingredient_3}' has a number in it. Please try again."
        else
            break
        end
    end

    puts 'Getting your suggested recipes from Food2Fork.'
    puts 'Your suggested recipes are:'

    recipe.process_search(ingredient_1, ingredient_2, ingredient_3)
    recipe.show_all_recipes

    puts 'Would you like to search again? Y/N'
    proceed = gets.chomp
        if proceed == 'Y'
            'Puts great!'
        else
            puts 'Thankyou for using the recipe search tool!'
            break
        end
end
