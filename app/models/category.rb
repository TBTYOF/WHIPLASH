class Category < ApplicationRecord
	has_many :blogs, through: :blog_categorys
	has_many :blog_categorys
end
