class Item < ApplicationRecord
  # genreモデルとのアソシエーション設定(genre_idの紐付け)
  belongs_to :genre

  # ActiveStoreage：画像使用宣言
  has_one_attached :image

  # 画像が登録されていない場合のエラー回避
  def get_image(width, height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image.variant(resize_to_limit: [width, height]).processed
  end

  # 消費税を加えた商品価格
  def add_tax_price
    (self.price * 1.10).round
  end

end
