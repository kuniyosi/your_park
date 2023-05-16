# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Admin.create!(
   email: 'admin@admin',
   password: 'testtest'
)

Tag.create([
  { name: '大規模公園' },
  { name: '小規模公園' },
  { name: '遊具が豊富' },
  { name: '自然豊か' },
  { name: '駐車場有り' }
])