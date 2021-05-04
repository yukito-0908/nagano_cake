class Admin::ItemsController < ApplicationController

   def top
    @items = Item.order(created_at: :desc).limit(4)
    @item = Item.new
    @customer = Customer.all
   end


  def new
    @item = Item.new
    @genres = Genre.all
  end

  def index
    @items = Item.all.page(params[:page]).per(10)
  end

  def create
    @genres = Genre.all
    @item = Item.new(item_params)
    if @item.save
      redirect_to admin_item_path(@item.id)
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
    @genre =Genre.find(@item.genre_id)
  end

  def edit
    @item = Item.find(params[:id])
    @genre =Genre.all
  end

  def update
    @item = Item.find(params[:id])
  if @item.update(item_params)
      redirect_to admin_item_path(@item.id)
  else
    render :update
  end
  end

   private

  def item_params
    params.require(:item).permit(:image,:name, :caption,:genre_id,:price, :is_active,:item_id,:introduction)
  end
end
