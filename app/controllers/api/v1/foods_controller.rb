class Api::V1::FoodsController < Api::V1::ApiController
  before_action :authenticate_user!

  load_resource expect: :index
  authorize_resource

  def index
    filters = {}
    filters[:min_calories] = params[:min_calories] unless params[:min_calories].blank?
    filters[:max_calories] = params[:max_calories] unless params[:max_calories].blank?
    filters[:like_tags] = params[:like_tags].split(',') unless params[:like_tags].blank?
    filters[:dislike_tags] = params[:dislike_tags].split(',') unless params[:dislike_tags].blank?

    @foods = Food
               .accessible_by(current_ability)
               .search(filters)
               .sample

    if @foods.present?
      render json: @foods, status: :ok
    else
      render json: {message: I18n.t('activerecord.exception.not_found')}, status: :not_found
    end
  end

  def show
    render json: @food, status: :ok
  end
end
