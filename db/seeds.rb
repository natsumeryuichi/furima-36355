# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
test_user_1 = User.create(nickname: "太郎", email: "taro@taro", password: "tarotaro")
test_user_2 = User.create(nickname: "花子", email: "hanako@hanako", password: "hanakohanako")

item_1 = Item.new(
 title: "スマートフォン",
 category_id: 7,
 price: 50000,
 user_id: test_user_1.id
 )
item_1.images.attach(io: File.open(Rails.root.join("./app/assets/images/star.png")), filename: 'star.png')
item_1.save

item_2 = Item.new(
 title: "子供服",
 category_id: 3,
 price: 1000,
 user_id: test_user_2.id
 )
item_2.images.attach(io: File.open(Rails.root.join("./app/assets/images/star.png")), filename: 'star.png')
item_2.save

item_3 = Item.create(
 title: "ドライヤー",
 category_id: 7,
 price: 3000,
 user_id: test_user_2.id
 )
item_3.images.attach(io: File.open(Rails.root.join("./app/assets/images/star.png")), filename: 'star.png')
item_3.save