class CreateOrderDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :order_details do |t|
      # order_detailsモデルのカラム追加 / テーブル定義書参照
      t.integer :item_id
      t.integer :order_id
      t.integer :amount
      t.integer :price
      t.integer :make_status, default: 0

      t.timestamps
    end
  end
end
