class Admin::OrderDetailsController < ApplicationController
  # 製作ステータス編集アクション
  def update
    @order_detail = OrderDetail.find(params[:id])
    @order = OrderDetail.order
    @order_detail.update(order_detail_params)
    redirect_to admin_order_path(@order)
  end

  private

  def order_detail_params
    require(:order_detail).permit(:make_status)
  end

end
