class OrderDetail < ApplicationRecord
  # orderモデルとのアソシエーション設定(order.idの紐付け)
  belongs_to :order

  # itemモデルとのアソシエーション設定(item.idの紐付け)
  belongs_to :item

end
