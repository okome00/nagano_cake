class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      # orderモデルのカラム追加 / テーブル定義書参照
      t.integer :customer_id
      t.string :postal_code
      t.string :address
      t.string :name
      t.integer :postage
      t.integer :total_price
      t.integer :payment, default: 0
      t.integer :order_status, default: 0

      t.timestamps
    end
  end
end
