class Admin::GenresController < ApplicationController
  # Sign_out中はアクセスできないように設定
  before_action :authenticate_admin!

  # ジャンル管理画面(一覧・追加)アクション
  def index
    @genre = Genre.new
    @genres = Genre.all
  end

  # ジャンル新規登録アクション
  def create
    @genre = Genre.new(genre_params)
    if @genre.save
      redirect_to admin_genres_path
    else
      @genres = Genre.all
      render :index
    end
  end

  # ジャンル編集画面アクション
  def edit
    @genre = Genre.find(params[:id])
  end

  # ジャンル編集アクション
  def update
    @genre = Genre.find(params[:id])
    if @genre.update(genre_params)
      redirect_to admin_genres_path
    else
      render :edit
    end
  end

  # 新規登録データのストロングパラメータ
  private
  def genre_params
    params.require(:genre).permit(:name)
  end

end
