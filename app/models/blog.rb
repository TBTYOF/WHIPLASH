class Blog < ApplicationRecord
	attachment :blog_image
	belongs_to :user
	has_many :comments, dependent: :destroy
end
