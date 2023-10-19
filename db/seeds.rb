# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# Admin.create!(email: '123@456', password: '123456')

くろ = Enduser.find_or_create_by!(email: "kuro@example.com") do |enduser|
  enduser.name = "くろくろ"
  enduser.password = "111111"
end

あきら = Enduser.find_or_create_by!(email: "akira@example.com") do |enduser|
  enduser.name = "あきら"
  enduser.password = "111111"
end

ゆにか = Enduser.find_or_create_by!(email: "yunika@example.com") do |enduser|
  enduser.name = "ゆにか"
  enduser.password = "111111"
end

Tag.find_or_create_by!(tag_title: "PL") do |tag|
end

Tag.find_or_create_by!(tag_title: "GM") do |tag|
end

Post.find_or_create_by!(enduser_id: 1) do |post|
  post.tag_id = 1
  post.title = "たとえこの身を捧げても"
  post.body = "募集人数3人です"
  post.url = "https://booth.pm/ja/items/4114884"
end

# Post.create!(enduser_id: 1) do |post|
#   post.tag_id = 1
#   post.title = "Parody people"
#   post.body = "募集人数4人です"
#   post.url = "https://booth.pm/ja/items/4991107"
# end

Post.find_or_create_by!(title: "Parody people") do |post|
  post.tag_id = 1
  post.enduser_id = 1
  post.body = "今日は、かつて送り出したアンドロイドたちが「学習」を終え、彼の研究所に帰って来る日。
……彼の執念が結実する、記念すべき１日になるはずだった。

「私たちは、グリム様が死に至った真相を突き止める必要があります。」
私たちは理解していた。
『グリム・ギャラクシー』は、もう永遠に帰らぬ旅に出たことを。
そして、私たちはそれぞれに行動する必要があることを。

「さぁ、議論を始めましょう。───何故なら、私たちはParody peopleなのですから。」"
  post.url = "https://booth.pm/ja/items/4991107"
end

