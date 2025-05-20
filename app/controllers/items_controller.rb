class ItemsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  def index
  end

  private

  def message_params
    params.require(:item).permit(:name, :description, :price, :image).merge(user_id: current_user.id)
  end
end
