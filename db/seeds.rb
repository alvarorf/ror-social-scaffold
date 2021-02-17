# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
users = User.create([{name: '123', email: '123456', password: '123456'},
{name: '1234', email: '1234@1234.com', password: '123456'},
{name: '12345', email: '12345@12345.com', password: '123456'} ])
posts = Post.create([{user_id: 1, content: 'Post 1 made by 123'},{user_id: 2, content: 'Post 2 made by 1234'},{user_id: 3, content: 'Post 3 made by 12345'}])
# comments = Comment.create([{},{},{}])
