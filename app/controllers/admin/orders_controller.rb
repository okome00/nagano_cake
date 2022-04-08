class Admin::OrdersController < ApplicationController
  # Sign_out中はアクセスできないように設定
  before_action :authenticate_admin!

  # 1ユーザーの注文履歴一覧　※できれば※
  def index
    @orders = current_customer.orders
  end

  # 注文履歴詳細画面アクション
  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
  end

  # 注文ステータス編集アクション
  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    redirect_to admin_order_path(@order)
  end

  private

  def order_params
    params.require(:order).permit(:order_status)
  end

end
