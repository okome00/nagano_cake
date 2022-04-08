class Address < ApplicationRecord
  # customerモデルとのアソシエーション設定(customer_idの紐付け)
  belongs_to :customer

  # バリデーション設定
  validates :name, presence: true
  validates :postal_code, presence: true
  validates :address, presence: true

end
