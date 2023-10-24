class Enduser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :image
  has_one_attached :profile_picture

  # フォローをした、されたの関係
  has_many :relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :reverse_of_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  # 一覧画面で使う
  has_many :followings, through: :relationships, source: :followed
  has_many :followers, through: :reverse_of_relationships, source: :follower

  has_many :posts, dependent: :destroy
  has_many :participants, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :calendars, dependent: :destroy
  attr_accessor :custom_playlist_name
  attr_accessor :custom_wantlist_name

  validates :name, presence: true, length: { minimum: 2, maximum: 20 }
  validates :encrypted_password, presence: true, length: { minimum: 6 }, confirmation: true

  def self.guest
    find_or_create_by(email: 'guest@example.com') do |enduser|
      enduser.password = SecureRandom.urlsafe_base64
      enduser.name = 'Guest User'  # デフォルトの名前を設定
      # 他のゲストユーザーの属性をここに追加する
    end
  end

  def active_for_authentication?
    super && (is_deleted == false)
  end

  def participate!(post)
    participants.create(post: post)
  end

  def participant_for(post)
    participants.find_by(post_id: post.id)
  end

  def guest?
  name == "Guest User"
  end

  def self.search_for(content, method)
      Enduser.where('name LIKE ?', '%' + content + '%')
  end

     # フォローしたときの処理
  def follow(enduser_id)
    relationships.create(followed_id: enduser_id)
  end
  # フォローを外すときの処理
  def unfollow(enduser_id)
    relationships.find_by(followed_id: enduser_id).destroy
  end
  # フォローしているか判定
  def following?(enduser)
    followings.include?(enduser)
  end

end
