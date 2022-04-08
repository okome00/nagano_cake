class CartItem < ApplicationRecord
  # customerモデルとのアソシエーション設定(customer_idの紐付け)
  # itemモデルとのアソシエーション設定(item_idの紐付け)
  belongs_to :customer
  belongs_to :item

  # バリデーション設定
  validates :amount, presence: true

end
