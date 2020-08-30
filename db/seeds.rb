# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Faker::Config.locale = :pt

User.create(name: "Administrator", email: "admin@admin.com", password: "admin@123", admin: true)
User.create(name: "User", email: "user@user.com", password: "user@123")

10.times do |i|
    Admin::Tag.create(name: Faker::Lorem.word.upcase, locale: :pt, user: User.first)
    Admin::Tag.create(name: Faker::Lorem.word.upcase, locale: :es, user: User.first)
end

10.times do |i|
    video = Admin::Video.new do |v|
        v.title = Faker::Movie.title
        v.url = 'https://www.youtube.com/embed/zpOULjyy-n8?rel=0'
        v.user = User.first
    end
    video.tags << Admin::Tag.first
    video.save
end

10.times do |i|
    news = Admin::News.new do |n|
        n.title = Faker::Lorem.sentence
        n.subtitle = Faker::Lorem.sentence
        n.content = Faker::Lorem.paragraph
        n.user = User.first
    end
    news.tags << Admin::Tag.first
    news.save
end
