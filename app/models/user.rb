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
    assoc.validates :email
    assoc.validates :password
  end

  with_options uniqueness: true do |assoc|
    assoc.validates :email
  end

  def self.guest
    find_or_create_by!(email: 'guest@example.com', name: "町民") do |user|
      user.password = SecureRandom.urlsafe_base64
    end
  end

  validates :name, inclusion: {in: %w[総務課 住民福祉課 産業建設課 教育委員会 町民], message: "%{value} は無効です"}
  validates :email, inclusion: { in: %w[soumu@taiji.town jyuumin@taiji.town sanken@taiji.town kyouiku@taiji.town guest@example.com], message: "%{value} is invalid" }
  validates :password, length: { minimum: 6 }
end
