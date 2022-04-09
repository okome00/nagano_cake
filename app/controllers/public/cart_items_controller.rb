class Public::CartItemsController < ApplicationController
  # Sign_out中はアクセスできないように設定
  before_action :authenticate_customer!

  # ショッピングカート画面アクション
  def index
    @cart_items = current_customer.cart_items
    @total = @cart_items.inject(0) { |sum, item| sum + item.subtotal }
  end

  # カートに商品を追加するアクション
  def create
    # 1.追加した商品がカート内に存在するか判断
    if @cart_item = current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id])
    # カート内の個数をフォームから送られた個数分追加する
      @cart_item.amount += params[:cart_item][:amount].to_i
    else
      @cart_item = CartItem.new(cart_item_params)
      @cart_item.customer_id = current_customer.id
    end
    @cart_item.save
    redirect_to cart_items_path
  end

  # カート内個数変更アクション
  def update
    @cart_items = CartItem.find(params[:id])
    @cart_items.update(amount: params[:amount])
    redirect_to cart_items_path
  end

  # カート内を空にするアクション
  def destroy_all
    @cart_items = current_customer.cart_items
    @cart_items.destroy_all
    redirect_to cart_items_path
  end

  # カート内の1商品を削除するアクション
  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to cart_items_path
  end

  # カート商品データのストロングパラメータ
  private

  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount, :customer_id)
  end

end
