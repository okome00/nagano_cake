class Admin::HomesController < ApplicationController
  # 注文履歴一覧（トップページ）アクション
  def top
    @orders = Order.page(params[:page])
  end

end
