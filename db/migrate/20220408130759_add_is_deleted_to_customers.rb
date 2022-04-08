class AddIsDeletedToCustomers < ActiveRecord::Migration[6.1]
  def change
    # 退会管理用カラム追加
    add_column :customers, :is_deleted, :boolean, default: false
  end
end
