class Blog < ApplicationRecord
	attachment :blog_image
	belongs_to :user
end
