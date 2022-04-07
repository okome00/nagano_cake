class CreateAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :addresses do |t|
      # addressモデルのカラム追加 / テーブル定義書参照
      t.integer :customer_id
      t.string :name
      t.string :postal_code
      t.string :address

      t.timestamps
    end
  end
end
