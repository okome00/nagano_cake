class Public::CustomersController < ApplicationController
  # 顧客マイページ画面アクション
  def show
    @customer = current_customer
  end

  # 会員情報編集画面アクション
  def edit
    @customer = current_customer
  end

  # 会員情報編集アクション
  def update
    @customer = current_customer
    if @customer.update(customer_params)
      redirect_to customers_my_page_path(@customer)
    else
      render :edit
    end
  end

  # 退会画面アクション
  def unsubscribe
    @customer = current_customer
  end

  # 退会アクション
  def withdraw
    @customer = current_customer
    @customer.update(is_active: false)
    reset_session
    redirect_to root_path
  end

  #　顧客データのストロングパラメータ
  private

  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number, :email)
  end

end
