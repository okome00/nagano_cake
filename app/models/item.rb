class Item < ApplicationRecord
  # genreモデルとのアソシエーション設定(genre_idの紐付け)
  belongs_to :genre

  # ActiveStoreage：画像使用宣言
  has_one_attached :image

end
