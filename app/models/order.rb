class Order < ApplicationRecord
  # customerモデルとのアソシエーション設定(customer.idの紐付け)
  # order_detailモデルとのアソシエーション設定(order.idの紐付け)
  belongs_to :customer
  has_many :order_details, dependent: :destroy

  # バリデーション設定
  validates :postal_code, presence: true
  validates :address, presence: true
  validates :name, presence: true
  validates :postage, presence: true
  validates :total_price, presence: true
  validates :payment, presence: true
  validates :order_status, presence: true

  # 支払方法（0=クレジットカード / 1=銀行振込）
  enum payment: {
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
