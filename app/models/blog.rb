class Blog < ApplicationRecord
	attachment :blog_image
	belongs_to :user
	has_many :comments, dependent: :destroy
	has_many :favorites, dependent: :destroy
	validates :title, presence: true
	validates :category, presence: true
	validates :category, length: { maximum: 10 }
	validates :blog_body, presence: true
	validates :blog_image, presence: true

	def favorited_by?(user)
		favorites.where(user_id: user.id).exists?
	end
end
