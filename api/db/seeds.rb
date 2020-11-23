# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
accounts = Account.create!([
  {uid: "example@example.com", password: "password", password_confirmation: "password", username: "example", email: "example@example.com"},
  {uid: "another@example.com", password: "password", password_confirmation: "password", username: "another", email: "another@example.com"}
])
authors = Master::Author.create!([
  {name: "上林 眞", name_kana: "かんばやし まこと", description: nil, twitter_id: "_mushiyaki", pixiv_id: "708530", website_url: nil},
  {name: "櫻井 マコト", name_kana: "さくらい まこと", description: nil, twitter_id: "relaxmakoto", pixiv_id: "454260", website_url: nil}
])
circles = Master::Circle.create!([
  {name: "むしやき!!", name_kana: "むしやき", description: nil, authors: [authors[0]]},
  {name: "カスタムサイズ", name_kana: "かすたむさいず", description: nil, authors: [authors[1]]}
])
books = Master::Book.create!([
  {title: "渡辺酔う？ ♡ようちかちゃんのお正月♡", published_at: "2019-12-30", coalition: false, explicit: false, book_size: "b5", genre_id: nil, page: 1, tora_id: nil, melon_id: nil, booth_id: nil, authors: [authors[0]], circles: [circles[0]]},
  {title: "恋するよう×ちか", published_at: "2019-12-30", coalition: false, explicit: false, book_size: "b5", genre_id: nil, page: 1, tora_id: nil, melon_id: nil, booth_id: nil, authors: [authors[1]], circles: [circles[1]]},
  {title: "船乗りの恋人(再録)", published_at: "2019-08-11", coalition: false, explicit: false, book_size: "a5", genre_id: nil, page: 1, tora_id: nil, melon_id: nil, booth_id: nil, authors: [authors[0]], circles: [circles[0]]}
])
User::Item.create!([
  {account: accounts[0], master: books[0]},
  {account: accounts[0], master: books[1]},
  {account: accounts[0], master: books[2]},
  {account: accounts[1], master: books[0]},
  {account: accounts[1], master: books[2]},
])
