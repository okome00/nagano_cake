class CreateGenres < ActiveRecord::Migration[6.1]
  def change
    create_table :genres do |t|
      # genreモデルのカラム追加 / テーブル定義書参照
      t.string :name
      
      t.timestamps
    end
  end
end
