class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @buyerinfo = BuyerInfo.new
  end

  def new
  end

  def create
       @item = Item.find(params[:item_id])
       @buyerinfo = BuyerInfo.new(buyer_params)
    if @buyerinfo.valid?
      @buyerinfo.save
      redirect_to root_path
    else
      render :index
    end
  end
  
  private

  def buyer_params
    params.permit(:postal_code, :prefecture_id, :city, :address, :building_name, :phone_number).merge(user_id: current_user.id, item_id: @item.id) 
  end
end
