class Order < ApplicationRecord
  # customerモデルとのアソシエーション設定(customer.idの紐付け)
  belongs_to :customer

  # order_detailモデルとのアソシエーション設定(order.idの紐付け)
  has_many :order_details, dependent: :destroy

end
