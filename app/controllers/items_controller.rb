class ItemsController < ApplicationController
  before_action :set_item, except: [:index ,:new, :create]
  before_action :authenticate_user!, only: [:new, :edit]
  before_action :diffrent_user, only: [:edit, :update, :destroy]

  def index
    @items = Item.all.order(created_at: :desc)
    following = current_user.follow(@user)
    
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
    @comments = @item.comments.includes(:user)
    @comment = Comment.new
    end

  def edit
    if @item.purchase_management.present?
      redirect_to root_path
    end
  end

  def update
    if @item.update(items_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def destroy
    if @item.destroy
      redirect_to root_path
    end
  end
  
end


private
def items_params
  params.require(:item).permit(:title, :explanation, :category_id, :condition_id, :shipping_charge_id, :prefecture_id, :shipping_day_id, :price, {images: []}).merge(user_id: current_user.id)
end

def set_item
  @item = Item.find(params[:id])
end

def diffrent_user
  item = Item.find(params[:id])
 unless item.user_id == current_user.id
   redirect_to action: :index
 end

end
