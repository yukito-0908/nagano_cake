class Public::OrdersController < ApplicationController

  def new
    @addresses = current_customer.addresses
  end


  def confirm
    @address = current_customer.addresses
    @order = Order.new(order_params)
    @cart_items = current_customer.cart_items
      if  params[:order][:address_option] == "0"
        @order.delivery_address = current_customer.address
        @order.delivery_name = current_customer.last_name + current_customer.first_name
        @order.delivery_postal_code = current_customer.postal_code
      elsif params[:order][:address_option] == "1"
        address = Address.find(params[:order][:address_id])
        @order.delivery_address = address.postal_code
        @order.delivery_postal_code = address.address
        @order.delivery_name = address.name
      end
      if  params[:order][:method_of_payment] == "true"
        @method_of_payment = "クレジットカード"
      elsif params[:order][:method_of_payment] == "false"
        @method_of_payment = "銀行振込"
      end
  end


  def index
    @orders = current_customer.orders.page(params[:page]).per(10)
  end

  def conprate
  end

  def create
    @cart_items = current_customer.cart_items
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.save
    @cart_items.each do |cart_item|
      @order_item = OrderItem.new({
        order_id: @order.id,
        item_id: cart_item.item.id,
        buy_price: cart_item.item.price,
        quantity: cart_item.amount,
      })
      @order_item.save
      
    end
    if @order.save
      @cart_items.destroy_all
      redirect_to public_orders_conprate_path
    else
      render:confirm
    end
  end

  def show
     @order = Order.find(params[:id])
     @order_items = @order.order_items
    if @order.is_deleted == "A"
      @deleted = "入金待ち"
    elsif @order.is_deleted == "B"
      @deleted = "入金確認"
    elsif @order.is_deleted == "C"
      @deleted = "制作中"
    elsif @order.is_deleted == "D"
      @deleted = "発送準備中"
    else
      @deleted = "発送済み"
    end
  end

  private

  def order_params
    params.require(:order).permit(:delivery_address,:delivery_name,:delivery_postal_code,:method_of_payment,:is_deleted,:updated_at)
  end
end
