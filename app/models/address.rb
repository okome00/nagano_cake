class Address < ApplicationRecord
  # customerモデルとのアソシエーション設定(customer_idの紐付け)
  belongs_to :customer
end
