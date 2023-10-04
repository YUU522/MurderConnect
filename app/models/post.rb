class Post < ApplicationRecord
  has_many :favorites, dependent: :destroy
  has_many :participants, dependent: :destroy
  belongs_to :end_user
  belongs_to :tag
end
