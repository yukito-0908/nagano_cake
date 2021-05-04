class Public::OrderItemsController < ApplicationController


  def create
  end

  private
    def order_item_params
      params.require(:order_item).permit(:quantity,:buy_price)
    end
end
