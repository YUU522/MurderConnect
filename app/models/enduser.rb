class Enduser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :image
  has_one_attached :profile_picture

  has_many :posts, dependent: :destroy
  has_many :participants, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :calendars, dependent: :destroy
  attr_accessor :custom_playlist_name
  attr_accessor :custom_wantlist_name
  def self.guest
    find_or_create_by(email: 'guest@example.com') do |enduser|
      enduser.password = SecureRandom.urlsafe_base64
      enduser.name = 'Guest User'  # デフォルトの名前を設定
      # 他のゲストユーザーの属性をここに追加する
    end
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
end
