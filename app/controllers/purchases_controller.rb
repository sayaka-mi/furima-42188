class PurchasesController < ApplicationController
  before_action :set_item, only: [:index, :create]
  def index
    @purchase_address = PurchaseAddress.new
  end

  def create
    @purchase_address = PurchaseAddress.new(purchase_params)
    if @purchase_address.valid?
      @purchase_address.save
      redirect_to root_path
    else
      puts @purchase_address.errors.full_messages
      render :index
    end
  end

  private

  def purchase_params
    params.require(:purchase_address)
    .permit(:post_code, :prefecture_id, :city, :block, :building_name, :phone_number)
    .merge(user_id: current_user.id, item_id: @item.id)
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

end
