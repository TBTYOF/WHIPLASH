class CategorysController < ApplicationController
	def create
	    blog = Blog.find(params[:blog_id])
	    category = current_user.categorys.new(category_params)
	    category.blog_id = blog.id
	    category.category = blog.category
	    category.save
	    binding.pry
	    redirect_to blog_path(blog.id)
	end

	def update
	end


	private
	def category_params
		params.require(:category).permit(:user, :blog, :category)
	end
end
