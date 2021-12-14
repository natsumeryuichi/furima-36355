class ItemsController < ApplicationController
  def index
    @item = Item.all
  end

  def new
    @items = Item.new
  end

  def create

  end
end