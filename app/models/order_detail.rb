class OrderDetail < ApplicationRecord
  # orderモデルとのアソシエーション設定(order.idの紐付け)
  belongs_to :order

  # itemモデルとのアソシエーション設定(item.idの紐付け)
  belongs_to :item

  # 製作ステータス（0=着手不可 / 1=製作待ち / 2=製作中 / 3=製作完了）
  enum make_status: {
    not_started: 0,
    wating: 1,
    making: 2,
    completed: 3
  }

end
