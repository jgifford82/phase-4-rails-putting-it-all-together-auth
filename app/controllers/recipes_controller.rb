class RecipesController < ApplicationController
    def index 
        # recipes = Recipe.all
        render json: Recipe.all
    end
    # In the index action, if the user is logged in (if their user_id is in the session hash):
    # Return a JSON response with an array of all recipes with their title, instructions, and minutes to complete data along with a nested user object; and an HTTP status code of 201 (Created)
    # If the user is not logged in when they make the request:
    # Return a JSON response with an error message, and a status of 401 (Unauthorized)

    def create
        recipe = @current_user.recipes.create!(recipe_params)
        render json: recipe, status: :created
    end

#     Now that users can log in, let's allow them to create new recipes!

# Handle recipe creation by implementing a POST /recipes route. It should:

# Be handled in the RecipesController with a create action
# In the create action, if the user is logged in (if their user_id is in the session hash):
# Save a new recipe to the database if it is valid. The recipe should belong to the logged in user, and should have title, instructions, and minutes to complete data provided from the params hash
# Return a JSON response with the title, instructions, and minutes to complete data along with a nested user object; and an HTTP status code of 201 (Created)
# If the user is not logged in when they make the request:
# Return a JSON response with an error message, and a status of 401 (Unauthorized)
# If the recipe is not valid:
# Return a JSON response with the error messages, and an HTTP status code of 422 (Unprocessable Entity)

private 
    def recipe_params
        params.permit(:title, :minutes_to_complete, :instructions)
    end
end
