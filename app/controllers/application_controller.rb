class ApplicationController < ActionController::API
  include ActionController::Cookies
  # from solutions file:
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response

  before_action :authorize

  private

  # from solutions file:
  # def authorize
  #   @current_user = User.find_by(id: session[:user_id])

  #   render json: { errors: ["Not authorized"] }, status: :unauthorized unless @current_user
  # end

  # video walkthrough:
  # def authorize
  #   user = User.find_by(id: session[:user_id])
  #   render json: { errors: ["Not authorized"] }, status: 401 unless user
  # end

    # video walkthrough updated later:
  def authorize
    @current_user = User.find_by(id: session[:user_id])
    render json: { errors: ["Not authorized"] }, status: 401 unless @current_user
  end

  # from solutions file:
  def render_unprocessable_entity_response(exception)
    render json: { errors: exception.record.errors.full_messages }, status: :unprocessable_entity
  end
end
