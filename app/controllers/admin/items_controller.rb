class Admin::ItemsController < ApplicationController
  # 商品一覧画面アクション
  def index
    @items = Item.all
  end

  # 商品新規登録画面アクション
  def new
    @item = Item.new
    @genres = Genre.all
  end

  # 商品新規登録アクション
  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to admin_item_path(@item)
    else
      render :new
    end
  end

  # 商品詳細画面アクション
  def show
    @item = Item.find(params[:id])
  end

  # 商品編集画面アクション
  def edit
    @item = Item.find(params[:id])
    @genres = Genre.all
  end

  # 商品編集アクション
  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to admin_item_path(@item)
    else
      render :edit
    end
  end

  # 新規登録データのストロングパラメータ
  private

  def item_params
    params.require(:item).permit(:image, :name, :introduction, :genre_id, :price, :is_active)
  end

end
