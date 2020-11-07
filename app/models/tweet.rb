class Tweet < ApplicationRecord

  belongs_to :user
  has_many :comments

  has_one_attached :image
  validates :name, presence: true
  validates :text, presence: true
  validates :image, presence: true

  mount_uploader :image, ImageUploader
end
