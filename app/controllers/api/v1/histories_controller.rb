class Api::V1::HistoriesController < Api::V1::ApiController
  before_action :authenticate_user!

  load_and_authorize_resource

  def index
    render json: @histories, status: :ok
  end

  def show
    render json: @history, status: :ok
  end

  def create
    @history = History.new(history_params)

    if @history.save
      render json: @history, status: :created
    else
      render json: {errors: [@history.errors.full_messages.to_sentence]}, status: :unprocessable_entity
    end
  end

  def destroy
    if @history.destroy
      render nothing: true, status: :no_content
    else
      render json: {errors: [@history.errors.full_messages.to_sentence]}, status: :unprocessable_entity
    end
  end

  private

  def history_params
    params.require(:history).permit(:food_id).merge(user_id: current_user.id)
  end
end
