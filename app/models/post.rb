class Post < ApplicationRecord
  has_many :favorites, dependent: :destroy
  has_many :participants, dependent: :destroy
  belongs_to :enduser
  belongs_to :tag
  
  def participanted_by?(enduser)
    participants.exists?(enduser_id: enduser.id)
  end
  
end
