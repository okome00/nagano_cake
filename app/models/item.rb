class Item < ApplicationRecord
  # genreモデルとのアソシエーション設定(genre_idの紐付け)
  # order_detailモデルとのアソシエーション設定(item.icの紐付け)
  belongs_to :genre
  has_many :order_details, dependent: :destroy

  # バリデーション設定
  validates :image, presence: true
  validates :name, presence: true
  validates :introduction, presence: true
  validates :genre_id, presence: true
  validates :price, presence: true

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
  def with_tax_price
    (price * 1.1).floor
  end

  # 検索機能追加
  def self.search(keyword)
    where(["genre_id like(?)", "%#{keyword}%"])
  end
end
