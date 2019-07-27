class CommentsController < ApplicationController
	def create
	    blog = Blog.find(params[:id])
	    comment = current_user.Comment.new(comment_params)
	    binding.pry
	    comment.save
	    redirect_to blog_path(blog.id)
	end

	def destroy
	end

	private
	def comment_params
		params.require(:comment).permit(:user, :blog, :comment_body)
	end
end
