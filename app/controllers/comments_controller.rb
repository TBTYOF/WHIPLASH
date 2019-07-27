class CommentsController < ApplicationController
	def create
	    blog = Blog.find(params[:blog_id])
	    comment = current_user.comments.new(comment_params)
	    comment.blog_id = blog.id
	    comment.save
	    redirect_to blog_path(blog.id)
	end

	def destroy
		blog = Blog.find(params[:blog_id])
		comment = Comment.find(params[:id])
		comment.destroy
		redirect_to blog_path(blog)
	end

	private
	def comment_params
		params.require(:comment).permit(:user, :blog, :comment_body)
	end
end
