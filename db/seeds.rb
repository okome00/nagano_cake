# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# 管理者ログインユーザー作成(test用)
Admin.create!(
  email: 'admin@admin',
  password: 'testtest'
)

# 顧客ログインユーザー作成(test用)
Customer.create!(
  last_name: 'てすと',
  first_name: '素子',
  last_name_kana: 'テスト',
  first_name_kana: 'モトコ',
  postal_code: '0000000',
  address: '北海道',
  telephone_number: '00000000000',
  is_active: 'true',
  email: 'customer@customer',
  password: 'customer'
  )
