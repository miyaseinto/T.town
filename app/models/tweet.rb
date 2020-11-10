class Tweet < ApplicationRecord

  belongs_to :user
  has_many :comments

  has_one_attached :image
  validates :name, presence: true
  validates :text, presence: true
  validates :image, presence: true

  def self.search(search)
    if search != ""
      Tweet.where('name LIKE(?)', "%#{search}%")
    else
      Tweet.all
    end
  end

  mount_uploader :image, ImageUploader
end
