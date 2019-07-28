class Blog < ApplicationRecord
	attachment :blog_image
	belongs_to :user
	has_many :comments, dependent: :destroy
	has_many :favorites, dependent: :destroy
	
	has_many :categorys, through: :blog_categorys
	has_many :blog_categorys
	accepts_nested_attributes_for :blog_categorys

	def favorited_by?(user)
		favorites.where(user_id: user.id).exists?
	end
end
