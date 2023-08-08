# frozen_string_literal: true

class ApplicationController < ActionController::API
  include Pundit::Authorization
  include ActionController::Cookies
  include ActionController::MimeResponds
  include Pagy::Backend

  respond_to :json

  # private
  #
  # # def verify_session
  # #   unless session[:user_id] && current_user
  # #     render json: {message: "You are not authorized to access this resource. Please log in."}, status: :unauthorized
  # #   end
  # # end
  #
  # def current_user
  #   current_user = User.find_by([:email])
  # end
end
