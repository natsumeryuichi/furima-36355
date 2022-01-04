class OrdersController < ApplicationController

  before_action :set_item, only:[:index,:create]

  def index
    @buyerinfo = BuyerInfo.new
    if user_signed_in? && @item.purchase_management.present?
      redirect_to root_path
    else
      authenticate_user!
    end

    if current_user.id == @item.user_id
      redirect_to root_path
    end
  end

  def new
  end

  def create
       @buyerinfo = BuyerInfo.new(buyer_params)
    if @buyerinfo.valid?
      pay_item
      @buyerinfo.save
      redirect_to root_path
    else
      render :index
    end
  end
  
  private

  def buyer_params
    params.require(:buyer_info).permit(:postal_code, :prefecture_id, :city, :address, :building_name, :phone_number, :item_id, :info_id).merge(token: params[:token], user_id: current_user.id, item_id: @item.id) 
  end

  def pay_item
     Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,
        card: buyer_params[:token],
        currency: 'jpy'
      )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

end
