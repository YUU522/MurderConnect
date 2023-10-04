class EndUser < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :participants, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :calenders, dependent: :destroy
end
