class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!
  include Pundit::Authorization

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :first_name, :last_name, :avatar])

    devise_parameter_sanitizer.permit(:account_update, keys: [:email, :first_name, :last_name, :avatar])
  end

  def after_sign_in_path_for(*)
    start_shift_path
  end

  unless Rails.application.config.consider_all_requests_local
    rescue_from ActiveRecord::RecordNotFound, with: :render_404
    rescue_from ActionController::RoutingError, with: :render_404
    rescue_from StandardError, with: :render_500
  end

  private

  def render_404
    respond_to do |format|
      format.html { render template: 'errors/not_found', status: :not_found }
      format.json { render json: { error: 'Not found' }, status: :not_found }
    end
  end

  def render_500(exception)
    logger.error(exception.message)
    logger.error(exception.backtrace.join("\n"))

    respond_to do |format|
      format.html { render template: 'errors/internal_server_error', status: :internal_server_error }
      format.json { render json: { error: 'Internal server error' }, status: :internal_server_error }
    end
  end

  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_to(request.referrer || root_path)
  end
end
