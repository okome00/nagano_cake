class Address < ApplicationRecord
  # customerモデルとのアソシエーション設定(customer_idの紐付け)
  belongs_to :customer

  # 登録済み配送先の表示設定
  def address_display
  '〒' + postal_code + ' ' + address + ' ' + name
  end

  # バリデーション設定
  validates :name, presence: true
  validates :postal_code, presence: true
  validates :address, presence: true

end
