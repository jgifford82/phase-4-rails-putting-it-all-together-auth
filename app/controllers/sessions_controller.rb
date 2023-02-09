class SessionsController < ApplicationController
    skip_before_action :authorize, only: :create

    def create
        user = User.find_by(username: params[:username])
        if user&.authenticate(params[:password])
          session[:user_id] = user.id
          render json: user
        else
          render json: { errors: ["Invalid username or password"] }, status: :unauthorized
        end   
    end

    # video walkthrough version:
    # def create
    #     user = User.find_by(username: params[:username])
    #     if user&.authenticate(params[:password])
    #       session[:user_id] = user.id
    #       render json: user
    #     else
    #       render json: { errors: ["Invalid username or password"] }, status: 401
    #     end   
    # end

    # Handle login by implementing a POST /login route. It should:

# Be handled in the SessionsController with a create action
# In the create action, if the user's username and password are authenticated:
# Save the user's ID in the session hash
# Return a JSON response with the user's ID, username, image URL, and bio
# If the user's username and password are not authenticated:
# Return a JSON response with an error message, and a status of 401 (Unauthorized)
# Make sure this route works as intended by running learn test before moving forward. You should also be able to test this in the React application by logging in via the login form.

# In the destroy action, if the user is logged in (if their user_id is in the session hash):
# Remove the user's ID from the session hash
# Return an empty response with an HTTP status code of 204 (No Content)
# If the user is not logged in when they make the request:
# Return a JSON response with an error message, and a status of 401 (Unauthorized)

    def destroy
        session.delete :user_id
        head :no_content
    end 

end
