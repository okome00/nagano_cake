class Public::OrdersController < ApplicationController
  # Sign_out中はアクセスできないように設定
  before_action :authenticate_customer!

  # 注文情報入力画面アクション
  def new
    @order = Order.new
    @customer = current_customer
    @address = Address.new
  end

  # 注文情報確認画面アクション
  def confirm
    @customer = current_customer
    @order = Order.new(order_params)
    @cart_items = current_customer.cart_items
    @total = @cart_items.inject(0) { |sum, item| sum + item.subtotal }
    @order.postage = 800
    @sum = (@total + @order.postage)

    # address_number1 "ご自身の住所"
    if params[:order][:select_address] == "0"
      @order.postal_code = @customer.postal_code
      @order.address = @customer.address
      @order.name = @customer.last_name + @customer.first_name
    # address_number2 "登録済みの住所から選択"
    elsif params[:order][:select_address] == "1"
      address = Address.find(params[:order][:address_id])
      @order.postal_code = address.postal_code
      @order.address = address.address
      @order.name = address.name
    # address_number3 "新しいお届け先"
    elsif params[:order][:select_address] == "2"
      @order.postal_code = params[:order][:postal_code]
      @order.address = params[:order][:address]
      @order.name = params[:order][:name]
    end
  end

  # 注文処理アクション
  def create
    @customer = current_customer
    @cart_items = current_customer.cart_items
    @order = current_customer.orders.new(order_params)
    if @order.save
      @cart_items.each do |cart_item|
        # 取り出したカート内アイテム分処理を繰り返す
        order_detail = OrderDetail.new
        order_detail.item_id = cart_item.item_id
        order_detail.order_id = @order.id
        order_detail.amount = cart_item.amount
        order_detail.price = cart_item.item.with_tax_price
        order_detail.save
      end
      # 注文完了後カートを空にする
      @cart_items.destroy_all
      redirect_to orders_thanks_path
    else
      render :new
    end
  end

  # 注文完了画面
  def thanks
  end

  # 注文履歴一覧アクション
  def index
    @orders = current_customer.orders
  end

  # 注文履歴詳細画面アクション
  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
  end

  # 注文データのストロングパラメータ
  private

  def order_params
    params.require(:order).permit(:postal_code, :address, :name, :postage, :total_price, :payment_method)
  end

end
