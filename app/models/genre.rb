class Genre < ApplicationRecord
  # itemモデルとのアソシエーション設定(genre_idの紐付け)
  has_many :items, dependent: :destroy

  # バリデーション設定
  validates :name, presence: true

end
