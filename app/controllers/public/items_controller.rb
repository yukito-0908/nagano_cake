class Public::ItemsController < ApplicationController
  def index
    @items = Item.where(is_active: true).page(params[:page]).per(8)
    @customer = Customer.all
  end
  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end

  def create
  end

   private
    def item_params
      params.require(:item).permit(:customer_id)
    end
end
