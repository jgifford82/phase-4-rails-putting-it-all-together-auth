class UsersController < ApplicationController
    # rescue_from ActiveRecord::RecordInvalid, with: :unprocessable_entity

    #after googling, added ", raise: false" below to clear error "ArgumentError (Before process_action callback :authorize has not been defined)"
    skip_before_action :authorize, only: [:create], raise: false

    # found this in solutions file, but it didn't pass the tests
    # def create
    #     user = User.create!(user_params)
    #     session[:user_id] = user.id
    #     render json: user, status: :created
    # end

    # could put "422" instead of :unprocessable_entity
    def create
        user = User.create!(user_params)
            session[:user_id] = user.id 
            render json: user, status: :created
    # rescue ActiveRecord::RecordInvalid => invalid
    #         render json: { errors: invalid.record.errors.full_messages }, status: :unprocessable_entity    
    end

    # Decided to use rescue_from instead of if/else statements
    # POST /signup
    # def create
    #     user = User.create(user_params)
    #     if user.valid? 
    #         session[:user_id] = user.id 
    #         render json: user, status: :created
    #     else
    #         render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
    #     end
    # end

    # from walkthrough video:
    # def create
    #     user = User.create!(user_params)
    #         session[:user_id] = user.id 
    #         render json: user, status: 201    
    # end 
    # rescue_from ActiveRecord::RecordInvalid, with: :handle_invalid
    # def handle_invalid
    #   render json: { errors: exception.record.errors.full_messages }, status: 422

    # def show
    #     user = User.find_by(id: session[:user_id])
    #     if user
    #         render json: user
    #     else
    #         render json: { error: "Not authorized" }, status: :unauthorized
    #     end
    # end

    # video walkthrough:
    def show
       render json: @current_user
    end

    private

    # def authorize 

    #     return render json: { error: "Not authorized" }, status: :unauthorized unless session.include? :user_id
    # end

    def user_params
        params.permit(:username, :password, :password_confirmation, :image_url, :bio)
    end

end
