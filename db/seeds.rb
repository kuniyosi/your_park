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

customers = Customer.create!(
  [
    {email: 'taro@taro', name: '茨木太郎', password: 'tarotaro', introduction: '茨木在住です。茨木の公園によく子供を連れて行きます。', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/人物.jpg"), filename:"人物.jpg")},
    {email: 'ziro@ziro', name: '吹田二郎', password: 'ziroziro', introduction: '二人の子供がいます。休日は大きな公園に子供を連れて出かけます。',profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/人物２.jpg"), filename:"人物２.jpg")},
    {email: 'sabu@sabu', name: '摂津三郎', password: 'sabusabu'},
    {email: 'siro@siro', name: '豊中四郎', password: 'sirosiro'},
    {email: 'goro@goro', name: '池田五郎', password: 'gorogoro'},
    {email: 'roku@roku', name: '箕面六郎', password: 'rokuroku'}
  ]
)

Tag.create!([
  { name: '大規模公園' },
  { name: '中規模公園' },
  { name: '小規模公園' },
  { name: '遊具が豊富' },
  { name: '自然豊か' },
  { name: 'バーベキューができる' },
  { name: '散歩におすすめ' },
  { name: '近くにお買い物施設がある' },
  { name: '駐車場有り' }
])

Park.create!(
  [
    {name: '玉瀬北公園', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/玉瀬北公園.jpg"), filename:"玉瀬北公園.jpg"), introduction: '滑り台やブランコなど遊具が豊富です。少し広めの運動場もあります', area: '茨木市', address: '茨木市玉瀬町'},
    {name: '内瀬公園', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/内瀬公園２.jpg"), filename:"内瀬公園２.jpg"), introduction: '小さな公園ですが滑り台や砂場があります。小さなお子様が遊ぶのにおすすめです', area: '茨木市', address: '茨木市内瀬町'},
    {name: '若園公園', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/若園公園.jpg"), filename:"若園公園.jpg"), introduction: '大きめの公園で遊具が豊富です。土日は多くの子供が遊んでいます。周辺は自然の多いエリアです', area: '吹田市', address: '吹田市若園町'}
  ]
)

# ParkとTagの関連づけ
ParkTag.create!([
  { park_id: 1, tag_id: 2 },
  { park_id: 1, tag_id: 4 },
  { park_id: 2, tag_id: 3 },
  { park_id: 3, tag_id: 1 },
  { park_id: 3, tag_id: 4 },
  { park_id: 3, tag_id: 5 }
])

# マイページから登録した公園を表示させるため
Favorite.create!([
  { customer_id: 1, park_id: 1 },
  { customer_id: 1, park_id: 2 },
  { customer_id: 1, park_id: 3 },
  { customer_id: 2, park_id: 1 },
  { customer_id: 2, park_id: 2 },
  { customer_id: 3, park_id: 1 },
  { customer_id: 4, park_id: 1 },
  { customer_id: 4, park_id: 2 }
])

# コメントとレビューを初期表示させるため
ParkComment.create!([
  { customer_id: 1, park_id: 1, comment: '広すぎずちょうど良い大きさの公園です', star: '4' },
  { customer_id: 1, park_id: 2, comment: '家の近くでよく利用します。遊具が幼児向けで小さな子供にぴったりです', star: '5' },
  { customer_id: 1, park_id: 3, comment: '休日によく利用します。同年代の子供が多く、遊具が豊富でお気に入りの公園です', star: '5' },
  { customer_id: 2, park_id: 1, comment: '運動場があるので子供とよくボール遊びをしています', star: '5' },
  { customer_id: 2, park_id: 2, comment: '近くにスーパーもあるので、遊んだ後の買い物も便利です', star: '4' },
  { customer_id: 3, park_id: 1, comment: '静かな公園で休日もあまり混まないのでよく利用します', star: '3' },
  { customer_id: 4, park_id: 3, comment: '大きな公園で散歩にちょうどいいです。自然も多く良い気持ちで歩けます', star: '5' },
  { customer_id: 4, park_id: 2, comment: '家の近くなのでよく利用します', star: '3' }
])