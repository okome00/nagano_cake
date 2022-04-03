class Admin::OrdersController < ApplicationController
  # 1ユーザーの注文履歴一覧　※できれば※
  def index
    @orders = Order.all
  end

  # 注文履歴詳細画面アクション
  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
  end

  # 注文ステータス編集アクション
  def update
  end

  private

  def order_params
    params.require(:order).permit(:order_status)
  end

end
