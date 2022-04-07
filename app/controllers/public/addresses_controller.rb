class Public::AddressesController < ApplicationController
  # 配送先一覧画面アクション
  def index
    @address = Address.new
    @addresses = current_customer.addresses
  end

  # 新規登録アクション
  def create
    @address = Address.new(address_params)
    @address.customer_id = current_customer.id
    if @address.save
      redirect_to addresses_path(@address)
    else
      @address = current_customer.address
      render :index
    end
  end

  # 配送先編集画面アクション
  def edit
    @address = Address.find(params[:id])
    # 他ユーザーが編集できないように設定
    if @address.customer_id == current_customer.id
      render :edit
    else
      redirect_to root_path
    end
  end

  # 編集アクション
  def update
    @address = Address.find(params[:id])
    @address.customer_id = current_customer.id
    if @address.update(address_params)
      redirect_to addresses_path(@address)
    else
      render :edit
    end
  end

  # 削除アクション
  def destroy
    @address = Address.find(params[:id])
    @address.destroy
    redirect_to addresses_path(@address)
  end

  private

  def address_params
    params.require(:address).permit(:postal_code, :address, :name)
  end

end
