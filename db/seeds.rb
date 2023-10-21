# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# Admin.create!(email: '123@456', password: '123456')

Enduser.find_or_create_by!(email: "kuro@example.com") do |enduser|
  enduser.name = "くろくろ"
  enduser.password = "111111"
end

Enduser.find_or_create_by!(email: "akira@example.com") do |enduser|
  enduser.name = "あきら"
  enduser.password = "111111"
end

Enduser.find_or_create_by!(email: "yunika@example.com") do |enduser|
  enduser.name = "ゆにか"
  enduser.password = "111111"
end

Tag.find_or_create_by!(tag_title: "PL") do |tag|
end

Tag.find_or_create_by!(tag_title: "GM") do |tag|
end

Post.find_or_create_by!(enduser_id: 2) do |post|
  post.tag_id = 1
  post.title = "たとえこの身を捧げても"
  post.body = "募集人数3人です＃みささげ"
  post.url = "https://booth.pm/ja/items/4114884"
end

Post.find_or_create_by!(title: "Parody people") do |post|
  post.tag_id = 1
  post.enduser_id = 2
  post.body = "今日は、かつて送り出したアンドロイドたちが「学習」を終え、彼の研究所に帰って来る日。
……彼の執念が結実する、記念すべき１日になるはずだった。

「私たちは、グリム様が死に至った真相を突き止める必要があります。」
私たちは理解していた。
『グリム・ギャラクシー』は、もう永遠に帰らぬ旅に出たことを。
そして、私たちはそれぞれに行動する必要があることを。

「さぁ、議論を始めましょう。───何故なら、私たちはParody peopleなのですから。」"
  post.url = "https://booth.pm/ja/items/4991107"
end

Post.find_or_create_by!(title: "竜眼湖伝説殺人事件") do |post|
  post.tag_id = 1
  post.enduser_id = 2
  post.body = "【日時】 10/15 (日)　21:30 ～ 23:30 予定 (+感想戦)
【募集人員】 5名(先着)
【観戦】 通過者のみ可
【プレイ形態】 DiscordによるVC 
【予想プレイ時間】 約2時間 + 感想戦
【特記事項】
・イヤフォンマイク、ヘッドセットマイクなどを必ず用意して下さい。
・スマートフォンでもプレイできますが、情報量が多いため、PDFを読みやすい端末での参加を推奨します。
・HO文字数4000字前後。
・マーダーミステリーが初めてでもプレイできるようにと制作しています。が、初心者には情報量は多めです。
・全員が同時に幸福な結末に辿り着くことは恐らくありません。

【参加条件】
※マダミス通過シナリオ数10本以下の方 (ウズを除く応募時点での通過数。視聴のみ・自害も含む) <状況次第で緩和予定>
※やむを得ない理由以外でのキャンセルをしない方
※強弁や高圧的な態度で場の雰囲気を壊さず、マナーよくプレイできる方
#竜眼湖"
  post.url = "https://booth.pm/ja/items/4831586"
end


Post.find_or_create_by!(title: "あやかし夜行奇譚") do |post|
  post.tag_id = 1
  post.enduser_id = 3
  post.body = "【募集人員】7名
【配信/録画】不可（GMの録画を参加者のみに公開）
【観戦】不可
【プレイ形態】Discord＋ココフォリア
【予想プレイ時間】4時間半＋感想戦30分
【その他】
GMの独断で参加をお断りする可能性がございます

【参加条件】
・PC使用の方
・イヤホンマイク/ヘッドセットのハウリング対策ができる方
・自己紹介・シナリオ体験リスト記入済みの方
・多弁、強弁しない方
・当日キャンセルしない/前科ロールが無い方
・深夜帯の連絡を許容いただける方
・Boothの内容およびプロモーション動画を閲覧された方（秘匿ムービーは絶対に見ないでください）
"
  post.url = "https://booth.pm/ja/items/4572165"
end

Post.find_or_create_by!(title: "僕はデブリになりたい") do |post|
  post.tag_id = 1
  post.enduser_id = 2
  post.body = "【日時】10/16 21:00-
【募集人数】3名（確定PL @まっちゃ ）
【プレイ形態】discord+ココフォリア
【予想プレイ時間】約2.5時間+感想戦
【その他】
・イヤホンマイク必須
・PC推奨
・当日HO読み込み

【参加条件】
・ハウリング対策を十分行っていること
・ココフォリアが問題なく動作すること＃僕デブ"
  post.url = "https://booth.pm/ja/items/4699307"
end

Post.find_or_create_by!(title: "エイダ") do |post|
  post.tag_id = 1
  post.enduser_id = 2
  post.body = "【日時】10月19日（木）20時～
【募集人員】PL5（先着順）
【観戦】可能（通過者のみ）
【録画】参加者全員の許可が得られた場合はOK
【配信】不可
【プレイ形態】Discord＋ココフォリア（PC必須）
【予想プレイ時間】３～４時間＋感想戦
【備考】

【参加条件】
・PC使用必須
・ココフォリア使用時に、BGM出力をONにして参加ができる方
 （一部、SEにて議論終了時刻を知らせます）
・ハウリング対策できる方
・BOOTH確認した方＃エイダ"
  post.url = "https://booth.pm/ja/items/4124519"
end

Post.find_or_create_by!(title: "星空のマリス") do |post|
  post.tag_id = 1
  post.enduser_id = 2
  post.body =  "【日時】10/21(土) 13:00～18:00(予定)
【使用シナリオ】星空のマリス
【募集人員】7名
【観戦】不可
【プレイ形態】Discord+ココフォリア
【流卓判断】前日23:59まで
【予想プレイ時間】4-5h
【その他】
・多弁、強弁しない
・ハウリング防止されている
・みんなで楽しむことがモットー
・メタ発言をせず、RPを楽しめる
・GM判断で参加希望を断る場合があります

【参加条件】
・⁠自己紹介 ⁠シナリオ体験リスト をご記入の方
・前科ロールのない方＃マリス"
  post.url = "https://ibarayugi.booth.pm/items/3078406"
end


Post.find_or_create_by!(enduser_id: 3) do |post|
  post.tag_id = 1
  post.title = "僕はデブリになりたい"
  post.body = "【日時】10/23 21:00~
【募集人数】4人(先着順)
【観戦】通過済の方であれば
【プレイ形態】discord+ココフォリア
【予想プレイ時間】約2.5時間+感想戦
【その他】
・イヤホンマイク必須
・PC推奨
・当日HO読み込み

【参加条件】
・イヤホンマイクやヘッドセットの準備ができる方
・リンク先BOOTHの販売情報をご確認のうえ問題のない方
・前科ロールのない方
・GMや他PLに強弁をせず、楽しくプレイしていただける方

以上をご確認のうえ、参加希望の方はGM宛にメンションをつけて(24時間OKです)
・参加条件を満たした旨
・マダミス経験数
・ココフォリア使用経験の有無
を記載のうえ参加表明をお願いいたします🙇＃僕デブ"
  post.url = "https://booth.pm/ja/items/4699307"
end
Post.find_or_create_by!(tag_id: 2) do |post|
  post.enduser_id = 3
  post.title = "エイダ"
  post.body = "【日時】10/28   20時30分〜 
【募集人員】4名
【観戦】無し
【プレイ形態】ココフォリア＋Discord
【予想プレイ時間】3.5h程度
【その他】
・ハウリング防止の為、イヤホンマイクやヘッドセットなどをご準備下さい
・多弁、強要等他の方が不快になるようなことをせず、マナーをちゃんと守ってください
・前科ロールがついていない方
・RPというよりキャラクターの気持ちに寄り添えるようなプレイングをお願いします
・初心者歓迎です！
・PCでの参加を基本とさせていただいていますが、どうしても携帯やタブレットにて参加したいという方はご相談ください
※GM経験少ない為不慣れな部分等あります、ご理解いただけると幸いです。＃エイダ"
  post.url = "https://booth.pm/ja/items/4124519"
end

Post.find_or_create_by!(title: "ブルーホールミステリー第一弾") do |post|
  post.tag_id = 1
  post.enduser_id = 3
  post.body =  "【募集人数】4名 (+1名確定 )
【GM】りおん様( @りおん )
【日時】10月22日(日) 14時～
【時間】4時間～5時間
【使用ツール】Discord＋ココフォリア（PC必要）
【観戦】不可
【配信録画可否】不可
【備考】
※イヤホンマイク又はヘッドセットでハウリング対策を行ってください。
※通過者は参加できません。
※読み合わせ要素が少し多いです。 
※早く集まりましたら事前HO決定をさせて頂きます。

【参加条件】
・BOOTHを確認済みの方
・どんな結末や過程でも楽しくセッションできる方す＃ブルミス"
  post.url = "https://booth.pm/ja/items/3844572"
end

Post.find_or_create_by!(enduser_id: 4) do |post|
  post.tag_id = 1
  post.title = "アンドロイドの告解"
  post.body = "【日時】10/17(火)20:00～23:00（予定）
【募集人員】4名
【プレイ形態】Discord＋ココフォリア
【予想プレイ時間】2.5時間+感想戦
【観戦】可
【その他】
・キャラクターの心情を重視してロールプレイをしたい方
・多弁、強弁を控え、常識的なマナーを守り、初心者の方とも楽しく遊べる方
・自己紹介とシナリオ体験リストを記載済みの方
・前科ロールが付与されていない方 
・PCでゲームにご参加いただける方
・ハウリング等のノイズ対策をされていること（イヤホンマイク/ヘッドセット推奨）
・連絡がスムーズに取れる方
・下記のURLから、作品概要を確認いただくこと
・GMの個人的見解にてお断りすることがあります。
＃アン告"
  post.url = "https://ccfolia.stores.jp/items/64b846de1edc270032c97c03"
end
Post.find_or_create_by!(title: "デモンズボックス") do |post|
  post.tag_id = 1
  post.enduser_id = 4
  post.body = "【日時】10月21日20時開始

【募集人員】2人（PL6名中4名確定のため）
【観戦】不可
【配信・動画】不可

【プレイ形態】Discord ＋ユドナリウム
【予想プレイ時間】3～4時間（感想戦含まず）

【注意事項】
・PCで参加できる方（ユドナリウムかつ盤面が重いため）
・資料、ルール、HO等ちゃんと読み込みできる方
・ハウリング防止のためヘッドセットやイヤホンマイクをご用意でき、ノイズが入らないように協力できる方

【参加条件】
・上記内容全てに同意できる方
・自己紹介、シナリオ体験リストに記載済みの方
・シナリオを楽しめる方（作品や参加者批判しない方）
・BOOTH販売ページも事前に確認していただける方＃デモンズボックス"
  post.url = "https://booth.pm/ja/items/2715042"
end