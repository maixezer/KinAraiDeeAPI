class Api::V1::ApiController < ApplicationController

  rescue_from CanCan::AccessDenied do |exception|
    render json: {message: I18n.t('authroization.unauthorized')}, status: :unauthorized
  end

  rescue_from ActiveRecord::RecordNotFound do |exception|
    render json: {message: I18n.t('activerecord.exception.not_found')}, status: :not_found
  end

  def current_user
    return unless doorkeeper_token
    @current_user ||= User.where(id: doorkeeper_token.resource_owner_id).first
  end

  def authenticate_user!
    head :unauthorized unless current_user
  end
end