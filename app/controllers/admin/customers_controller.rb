class Admin::CustomersController < ApplicationController
  # 会員一覧画面アクション
  def index
    @customers = Customer.all
  end

  # 会員詳細画面アクション
  def show
    @customer = Customer.find(params[:id])
  end

  # 会員編集画面アクション
  def edit
    @customer = Customer.find(params[:id])
  end

  # 会員編集アクション
  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      redirect_to admin_customer_path(@customer)
    else
      render :edit
    end
  end

  # 会員データストロングパラメータ
  private

  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :encrypted_password, :postal_code, :address, :telephone_number, :is_active)
  end

end
