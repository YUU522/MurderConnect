class Post < ApplicationRecord
  has_many :favorites, dependent: :destroy
  has_many :participants, dependent: :destroy
  belongs_to :enduser
  belongs_to :tag
  has_many :post_hashtag_relations , dependent: :destroy
  has_many :hashtags, through: :post_hashtag_relations, dependent: :destroy
  has_one_attached :thumbnail

  def self.search_for(content, method)
    if method == 'perfect'
      Post.where(title: content)
    elsif method == 'forward'
      Post.where('title LIKE ?', content + '%')
    elsif method == 'backward'
      Post.where('title LIKE ?', '%' + content)
    else
      Post.where('title LIKE ?', '%' + content + '%')
    end
  end

  def participanted_by?(enduser)
    participants.exists?(enduser_id: enduser.id)
  end
  def caption
    # ここで投稿のキャプション（例: 本文やタイトル）を返すコードを書く
    return self.body
  end

    after_create do
      hashtags = self.body.scan(/[#＃][\w\p{Han}ぁ-ヶｦ-ﾟー]+/)
      self.body = self.body.gsub(/[#＃][\w\p{Han}ぁ-ヶｦ-ﾟー]+/, '') # ハッシュタグを除去
      self.save
      self.hashtags = [] # ハッシュタグの関連をクリア
      unique_hashtags = hashtags.uniq.map { |hashtag| hashtag.downcase.delete('#＃') }
      hashtags.uniq.map do |hashtag|
        tag = Hashtag.find_or_create_by(hashname: hashtag.downcase.delete('#＃'))
        self.hashtags << tag
      end
    end

    before_update do
      post = Post.find_by(id: self.id)
      post.hashtags.clear
      hashtags = self.caption.scan(/[#＃][\w\p{Han}ぁ-ヶｦ-ﾟー]+/)
      hashtags.uniq.map do |hashtag|
        tag = Hashtag.find_or_create_by(hashname: hashtag.downcase.delete('#'))
        post.hashtags << tag
      end
    end
    def og_image
      og = OpenGraph.new(self.url)
      # og.title # => "Open Graph protocol"
      # og.type # => "website"
      # og.url # => "http://ogp.me/"
      # og.description # => "The Open Graph protocol enables any web page to become a rich object in a social graph."
      return og.images[0] # => ["http://ogp.me/logo.png"]
    end
end
