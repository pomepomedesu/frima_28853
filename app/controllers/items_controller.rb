class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]

  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)
    if @item.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end
  private

  def item_params
    params.require(:item).permit(:name, :image,:writings, :price,:category_id, :condition_id, :shipping_charges_id, :prefecture_id, :delivery_days_id,:user_id)
    .merge(user_id: current_user.id)
  end
end