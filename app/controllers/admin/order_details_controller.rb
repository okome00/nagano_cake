class Admin::OrderDetailsController < ApplicationController
  # Sign_out中はアクセスできないように設定
  before_action :authenticate_admin!

  # 製作ステータス編集アクション
  def update
    @order_detail = OrderDetail.find(params[:id])
    @order_detail.update(order_detail_params)
    redirect_to admin_order_path
  end

  # 製作ステータスのストロングパラメータ
  private

  def order_detail_params
    params.require(:order_detail).permit(:make_status)
  end

end
