class Public::CartItemsController < ApplicationController
  def index
    @cart_items = current_customer.cart_items
  end

  def create
    @cart_item = CartItem.new(cart_item_params)
    existing_cart_item = current_customer.cart_items.find_by(item_id: @cart_item.item_id)

    if existing_cart_item
      existing_cart_item.update(amount: existing_cart_item.amount + @cart_item.amount)
    else
      @cart_item.customer_id = current_customer.id
    if @cart_item.save
    else
        render:index
    end
    end
    redirect_to public_cart_items_path
  end

  def show
  end

  def edit
  end

  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(cart_item_params)
    redirect_to public_cart_items_path
  end

  def destroy
    @cart_items = CartItem.find(params[:id])
    @cart_items.destroy
    redirect_to public_cart_items_path
  end

  def destroy_all
    @cart_items = current_customer.cart_items
    @cart_items.destroy_all
    redirect_to public_cart_items_path
  end

  private
    def cart_item_params
      params.require(:cart_item).permit(:amount,:item_id,:customer_id,:image)
    end
end
