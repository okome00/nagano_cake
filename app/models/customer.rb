class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # addressモデルとのアソシエーション設定(customer_idの紐付け)
  has_many :addresses, dependent: :destroy

end
