class CommentsController < ApplicationController
	def create
	    @blog = Blog.find(params[:blog_id])
	    @comment = current_user.comments.new(comment_params)
	    @comment.blog_id = @blog.id
	    if @comment.save
	    	redirect_to blog_path(@blog.id), notice: 'You have creatad comment successfully.'
	    else
	    	@info_user = @blog.user
		    @login_user = current_user
		    @create_user = current_user
		    @create_new = Blog.new
		    @comments = @blog.comments.page(params[:page]).reverse_order
		    @side_images = @info_user.blogs.order("RANDOM()").limit(10)
	    	render 'blogs/show', info_user: @info_user, login_user: @login_user, create_user: @create_user,
	    						create_new: @create_new, blog: @blog, comment: @comment, comments: @comments
	    end
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
