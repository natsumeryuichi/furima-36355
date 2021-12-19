class ItemsController < ApplicationController
  def index
    @items = Item.all.order(created_at: :desc)
  end

  def new
    @item = Item.new
    unless user_signed_in?
      before_action :authenticate_user!
    end
  end

  def create
    @item = Item.create(items_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    unless current_user.id == Item.ids
      redirect_to root_path
    end
    @item = Item.find(params[:id])
  end
  
end


private
def items_params
  params.require(:item).permit(:title, :explanation, :category_id, :condition_id, :shipping_charge_id, :prefecture_id, :shipping_day_id, :price, :image).merge(user_id: current_user.id)
end