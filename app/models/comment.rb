class Comment < ApplicationRecord
	belongs_to :user
	belongs_to :blog
	validates :comment_body, presence: true
end
