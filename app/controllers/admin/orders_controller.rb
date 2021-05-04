class Admin::OrdersController < ApplicationController
  def new
    @address = Address.new
  end


  def show
    @orders = current_customer.orders
    @orders1 = Order.all
    @cart_items = current_customer.cart_items
    @params = params[:button]
end

def create
  
end

def index
  @order_items = OrderItem.all.page(params[:page]).per(8)


end

  private

  def order_params
    params.require(:order).permit(:name, :address,:postal_code,:introduction)
  end
end
