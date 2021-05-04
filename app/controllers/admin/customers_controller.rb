class Admin::CustomersController < ApplicationController
  def index
    @customers = Customer.all.page(params[:page]).per(10)
  end

  def edit
    @customer = current_customer
  end


  def show
    @customer = current_customer
  end

  def update
    @customer = current_customer
   if @customer.update(customer_params)
    redirect_to admin_customers_path
    else
    render :edit
  end
  end

  private
    def customer_params
      params.require(:customer).permit(:name,:email,:first_name,:last_name_kana,:last_name,:first_name_kana,:address,:postal_code,:telephone_number,:is_active)
    end
end
