class Public::ItemsController < ApplicationController
  # 顧客商品一覧画面アクション
  def index
    @items = Item.page(params[:page]).per(8)
    @genres = Genre.all
    @all_items = Item.all
  end

  # 顧客商品詳細画面アクション
  def show
    @item = Item.find(params[:id])
    @genres = Genre.all
    @cart_item = CartItem.new
  end

  def search
    @items = Item.search(params[:keyword])
    @keyword = params[:keyword]
    render :index
  end

end
