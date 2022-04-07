class Order < ApplicationRecord
  # customerモデルとのアソシエーション設定(customer.idの紐付け)
  belongs_to :customer

  # order_detailモデルとのアソシエーション設定(order.idの紐付け)
  has_many :order_details, dependent: :destroy

  # 支払方法（0=クレジットカード / 1=銀行振込）
  enum payment_method: {
    credit_card: 0,
    transfer: 1
  }

  # 注文ステータス（0=入金待ち / 1=入金確認 / 2=製作中 / 3=発送準備中 / 4=発送済み）
  enum order_status: {
    wating: 0,
    confirmation: 1,
    making: 2,
    preparation: 3,
    shipped: 4
  }

end
