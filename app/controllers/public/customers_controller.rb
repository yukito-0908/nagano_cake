class Public::CustomersController < ApplicationController
  def show
    @customer = current_customer
    
  end

  def unsubscribe
    @user = User.find(current_user.id)
    @user.update(is_active: "Invalid")
    reset_session
    redirect_to root_path
  end

  def edit
    @customer = current_customer
  end

  def update
    @customer = current_customer
    @customer.update(customer_params)
    redirect_to public_customers_mypage_path
  end

  def destroy
    @customer = current_customer
    @customer.destroy
    redirect_to root_path
  end

  private
    def customer_params
      params.require(:customer).permit(:name,:email,:first_name,:last_name_kana,:last_name,:first_name_kana,:address,:postal_code,:email,:telephone_number,:is_deleted)
    end
end
