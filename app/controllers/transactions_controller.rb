class TransactionsController < ApplicationController
  before_action :set_item, only: [:index, :create]
  before_action :move_to_sign_up, only: [:index,:new,:create]
  before_action :move_to_index,   only: [:index,:new,:create]

  def index
    @transaction = Purchaser.new
  end

  def new
    @transaction = Purchaser.new
  end

  def create
    @transaction = Purchaser.new(transaction_params)
    if @transaction.valid?
      pay_item
      @transaction.save
     redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def transaction_params
    params.permit(:phone_number, :postal_code, :prefecture_id, :city, :house_number, :building_name,:token).merge(user_id: current_user.id,item_id: @item.id, buyer_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key =  ENV["PAYJP_SECRET_KEY"] 
    Payjp::Charge.create(
      amount: @item.price,  
      card:   params[:token],    
      currency:'jpy'                 
    )
  end

  def move_to_sign_up
    unless user_signed_in?
      render 'devise/sessions/new'
    end
  end

  def move_to_index
    if current_user.id == @item.user_id
      redirect_to root_path
    elsif @item.buyer 
      redirect_to root_path
    end
  end

end
