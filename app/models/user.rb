class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  attachment :profile_image
  validates :name, presence: true
  validates :name, length: { in: 2..10 }
  validates :mini_profile_text, length: { maximum: 35 }
  validates :profile_text, length: { maximum: 150 }
  has_many :blogs, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
end
