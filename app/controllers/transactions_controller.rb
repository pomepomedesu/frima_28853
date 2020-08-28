class TransactionsController < ApplicationController
  before_action :set_item, only: [:index, :create]
  def index
  end

  def new
    @transaction = Purchaser.new
  end

  def create
    @transaction = Purchaser.new(transaction_params)
    if @transaction.valid?
       @transaction.save
       return redirect_to root_path
    else
      render "index"
    end
  end

  private

  def transaction_params
    params.permit(:phone_number, :postal_code, :prefecture_id, :city, :house_number, :building_name).merge(user_id: current_user.id,item_id: @item.id, buyer_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
end
