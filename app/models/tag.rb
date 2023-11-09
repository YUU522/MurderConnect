class Tag < ApplicationRecord
  has_many :posts, dependent: :destroy
  validates :tag_title, presence: true
end
