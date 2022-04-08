class Public::CartItemsController < ApplicationController
  # Sign_out中はアクセスできないように設定
  before_action :authenticate_customer!

  def index
  end
end
