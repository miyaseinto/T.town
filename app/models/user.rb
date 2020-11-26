class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :tweets
  has_many :comments
  has_many :likes
  has_many :messages

  with_options presence: true do |assoc|
    assoc.validates :name
  end

  def self.guest
    find_or_create_by!(email: 'guest@example.com',name: "町民") do |user|
      user.password = SecureRandom.urlsafe_base64
    end
  end


end
