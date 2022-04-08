class Public::OrdersController < ApplicationController
  # Sign_out中はアクセスできないように設定
  before_action :authenticate_customer!

  def new
  end

  def confirm
  end

  def thanks
  end

  def index
  end

  def show
  end
end
