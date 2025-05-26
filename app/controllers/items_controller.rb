class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  def index
    @items = Item.order(created_at: :desc)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      flash.now[:alert] = 'Failed to create the item.'
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
    redirect_to root_path unless current_user == @item.user
  end

  def update
    @item = Item.find(params[:id])
    if current_user == @item.user
      if @item.update(item_params)
        redirect_to item_path(@item)
      else
        render :edit, status: :unprocessable_entity
      end
    else
      redirect_to root_path
    end
  end



  private

  def item_params
    params.require(:item).permit(:name, :description, :price, :image, :category_id, :condition_id, :shopping_fee_burden_id,
                                 :prefecture_id, :delivery_time_id).merge(user_id: current_user.id)
  end
end
