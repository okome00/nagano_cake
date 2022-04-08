class Admin::HomesController < ApplicationController
  # Sign_out中はアクセスできないように設定
  before_action :authenticate_admin!

  # 注文履歴一覧（トップページ）アクション
  def top
    @orders = Order.page(params[:page])
  end

end
