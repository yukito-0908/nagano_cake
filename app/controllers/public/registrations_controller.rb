class Public::RegistrationsController < ApplicationController

  def new
    @customer = Customer.new
  end



  def create
    @customer = Customer.new(customer_params)
   @customer.save
    redirect_to   public_items_path
  end


    private
    def customer_params
      params.require(:customer).permit(:name,:email,:first_name,:last_name_kana,:last_name,:first_name_kana,:address,:postal_code,:email,:telephone_number,:is_deleted)
    end
end
