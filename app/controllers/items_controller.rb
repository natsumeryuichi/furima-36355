class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]
  before_action :diffrent_user, only: [:edit, :update]

    def index
    @items = Item.all.order(created_at: :desc)
  end

  def new
    @item = Item.new
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
    @item = Item.find(params[:id])
  end

  def update
    item = Item.find(params[:id])
    if item.update(items_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def diffrent_user
  item = @item = Item.find(params[:id])
  unless item.user_id == current_user.id
    redirect_to action: :index
  end
  
end


private
def items_params
  params.require(:item).permit(:title, :explanation, :category_id, :condition_id, :shipping_charge_id, :prefecture_id, :shipping_day_id, :price, :image).merge(user_id: current_user.id)
end

end
